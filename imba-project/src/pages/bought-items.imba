
import {
	data,
	getAllItems,
	getBoughtItems,
	getTotalPrice,
	removeItem
} from "../../data.js"

# css bought-items > a td:none d:flex ai:flex-end g:2em m: 1em 3.2em w:auto min-width:max-content

tag bought-items
	# items = getBoughtItems().filter do(item) item.count 	# would be an api call
	prop items
	def handleClick(itemId)
		const item = items.find do(item) item.id === itemId
		item.count = 0;

	def handleChange e
		const {id, value} = e.target
		const item = items.find do(item) item.id === id
		item.count = value
		
	
	# I need to save to localStorage, the count and id of the item added to the cart.
	# initialise item count to the data in localStorage
	# update the item count in localStorage when the count has been changed!

	<self.container [d:vflex g:.5em]>
			<h1 [m:.5em 2rem c:white fs:4rem]> "Bought Items"
			for item in items
				unless item.count === 0
					<div.menu-item [td:none d:flex ai:flex-end g:2em m: 1em 3.2em w:auto min-width:max-content]>
						<img.item-image src=item.imgUrl />
						<div.item-content [ai:end g:1.4em]>
							<h1.item-name> item.name
							<h2.item-price> "R {item.price}"
							<div [d:flex ai:center g: .5em]>
								<input.item-count-input
									type="number"
									id=item.id 	
									bind=item.count
									@change=handleChange(e)
								/>
								<button.item-count-icon @click=handleClick(item.id)> "Remove"