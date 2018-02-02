# ReuseIdentifierInterface_Test

* Una vez asignas este protocolo al Controllador de vista o a una Celda  de una tabla o de una colección puedes simplemente olvidarte de inventarte nombres para el (Reuse Identifier), que normalmente olvidamos. 

```swift
public protocol ReuseIdentifierInterface : class{
    static var defaultReuseIdentifier : String { get }
}

public extension ReuseIdentifierInterface where Self : UIView{
    static var defaultReuseIdentifier : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
```
* Implementación en la Celda Caso 1
```swift
class CustomCell: UITableViewCell, ReuseIdentifierInterface {
```

* Caso de uso en el registro de una celda dentro de una vista de tabla

 1.Registro de la celda
 Aqui es donde normalmente se usa entre "" el nombre del .xib y le asignamos un nombre del celda para reutilizar
        
 2.Pues con esta interfaz publica que me sirve no solo de Celdas sino Controladores
 obtenemos el nombre exacto de la UIView y excluye ".swift" y nos olvidamos
 de nombres inventados
 
 ```swift
 tableView.register(UINib(nibName: CustomCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CustomCell.defaultReuseIdentifier)
 ```
 * Implementación al crear la celda dentro del metodo data source de la tabl
 ```swift
 let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.defaultReuseIdentifier, for: indexPath) as! CustomCell
            cell.myAceptarButton.addTarget(self,
                                           action: #selector(showAlert),
                                           for: .touchUpInside)
            return cell
 ```
