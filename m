Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B634C8D
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 23:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC680C15;
	Sat, 21 Oct 2023 16:47:49 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D9C23F64C;
	Sat, 21 Oct 2023 16:47:07 -0700 (PDT)
Date: Sun, 22 Oct 2023 00:46:03 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng
 <uwu@icenowy.me>, Maxim Kiselev <bigunclemax@gmail.com>, Sam Edwards
 <cfsworks@gmail.com>, Okhunjon Sobirjonov <okhunjon72@gmail.com>,
 linux-sunxi@lists.linux.dev, andre.przywara@foss.arm.com, Jagan Teki
 <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Subject: Re: [PATCH v2 05/22] pinctrl: sunxi: add GPIO in/out wrappers
Message-ID: <20231022004603.35a5c10d@slackpad.lan>
In-Reply-To: <62360412-0e23-b35d-b93a-7bebebe83adf@sholland.org>
References: <20230928215455.28094-1-andre.przywara@arm.com>
	<20230928215455.28094-6-andre.przywara@arm.com>
	<62360412-0e23-b35d-b93a-7bebebe83adf@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Oct 2023 03:30:48 -0500
Samuel Holland <samuel@sholland.org> wrote:

> Hi Andre,
> 
> On 9/28/23 16:54, Andre Przywara wrote:
> > So far we were open-coding the pincontroller's GPIO output/input access
> > in each function using that.
> > 
> > Provide functions that wrap that nicely, and follow the existing pattern
> > (set/get_{bank,}), so users don't need to know about the internals, and
> > we can abstract the new D1 pinctrl more easily.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/gpio/sunxi_gpio.c | 55 ++++++++++++++++++---------------------
> >  1 file changed, 25 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpio/sunxi_gpio.c b/drivers/gpio/sunxi_gpio.c
> > index 71c3168b755..a4b336943b6 100644
> > --- a/drivers/gpio/sunxi_gpio.c
> > +++ b/drivers/gpio/sunxi_gpio.c
> > @@ -81,6 +81,19 @@ int sunxi_gpio_get_cfgpin(u32 pin)
> >  	return sunxi_gpio_get_cfgbank(pio, pin);
> >  }
> >  
> > +static void sunxi_gpio_set_output_bank(struct sunxi_gpio *pio,
> > +				       int pin, bool set)
> > +{
> > +	u32 mask = 1U << pin;
> > +
> > +	clrsetbits_le32(&pio->dat, set ? 0 : mask, set ? mask : 0);
> > +}
> > +
> > +static int sunxi_gpio_get_output_bank(struct sunxi_gpio *pio, int pin)  
> 
> "get_output" is a bit misleading when this pin is an input, so maybe
> "set_value" and "get_value" would be more accurate.

Good point, changed that.

> 
> > +{
> > +	return !!(readl(&pio->dat) & (1U << pin));
> > +}
> > +
> >  void sunxi_gpio_set_drv(u32 pin, u32 val)
> >  {
> >  	u32 bank = GPIO_BANK(pin);
> > @@ -117,35 +130,20 @@ void sunxi_gpio_set_pull_bank(struct sunxi_gpio *pio, int bank_offset, u32 val)
> >  /* =========== Non-DM code, used by the SPL. ============ */
> >  
> >  #if !CONFIG_IS_ENABLED(DM_GPIO)
> > -static int sunxi_gpio_output(u32 pin, u32 val)
> > +static void sunxi_gpio_set_output(u32 pin, bool set)
> >  {
> > -	u32 dat;
> >  	u32 bank = GPIO_BANK(pin);
> > -	u32 num = GPIO_NUM(pin);
> >  	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
> >  
> > -	dat = readl(&pio->dat);
> > -	if (val)
> > -		dat |= 0x1 << num;
> > -	else
> > -		dat &= ~(0x1 << num);
> > -
> > -	writel(dat, &pio->dat);
> > -
> > -	return 0;
> > +	sunxi_gpio_set_output_bank(pio, GPIO_NUM(pin), set);
> >  }
> >  
> > -static int sunxi_gpio_input(u32 pin)
> > +static int sunxi_gpio_get_output(u32 pin)
> >  {
> > -	u32 dat;
> >  	u32 bank = GPIO_BANK(pin);
> > -	u32 num = GPIO_NUM(pin);
> >  	struct sunxi_gpio *pio = BANK_TO_GPIO(bank);
> >  
> > -	dat = readl(&pio->dat);
> > -	dat >>= num;
> > -
> > -	return dat & 0x1;
> > +	return sunxi_gpio_get_output_bank(pio, GPIO_NUM(pin));
> >  }
> >  
> >  int gpio_request(unsigned gpio, const char *label)
> > @@ -168,18 +166,21 @@ int gpio_direction_input(unsigned gpio)
> >  int gpio_direction_output(unsigned gpio, int value)
> >  {
> >  	sunxi_gpio_set_cfgpin(gpio, SUNXI_GPIO_OUTPUT);
> > +	sunxi_gpio_set_output(gpio, value);
> >  
> > -	return sunxi_gpio_output(gpio, value);
> > +	return 0;
> >  }
> >  
> >  int gpio_get_value(unsigned gpio)
> >  {
> > -	return sunxi_gpio_input(gpio);
> > +	return sunxi_gpio_get_output(gpio);
> >  }
> >  
> >  int gpio_set_value(unsigned gpio, int value)
> >  {
> > -	return sunxi_gpio_output(gpio, value);
> > +	sunxi_gpio_set_output(gpio, value);
> > +
> > +	return 0;
> >  }
> >  
> >  int sunxi_name_to_gpio(const char *name)
> > @@ -231,13 +232,8 @@ int sunxi_name_to_gpio(const char *name)
> >  static int sunxi_gpio_get_value(struct udevice *dev, unsigned offset)
> >  {
> >  	struct sunxi_gpio_plat *plat = dev_get_plat(dev);
> > -	u32 num = GPIO_NUM(offset);
> > -	unsigned dat;
> > -
> > -	dat = readl(&plat->regs->dat);
> > -	dat >>= num;
> >  
> > -	return dat & 0x1;
> > +	return sunxi_gpio_get_output_bank(plat->regs, offset) & 0x1;  
> 
> You don't need the "& 0x1" anymore. Otherwise:

Ah, correct, we have a !! in the callee now. Fixed.

> Reviewed-by: Samuel Holland <samuel@sholland.org>

Thanks!
Andre

> 
> >  }
> >  
> >  static int sunxi_gpio_get_function(struct udevice *dev, unsigned offset)
> > @@ -275,9 +271,8 @@ static int sunxi_gpio_set_flags(struct udevice *dev, unsigned int offset,
> >  
> >  	if (flags & GPIOD_IS_OUT) {
> >  		u32 value = !!(flags & GPIOD_IS_OUT_ACTIVE);
> > -		u32 num = GPIO_NUM(offset);
> >  
> > -		clrsetbits_le32(&plat->regs->dat, 1 << num, value << num);
> > +		sunxi_gpio_set_output_bank(plat->regs, offset, value);
> >  		sunxi_gpio_set_cfgbank(plat->regs, offset, SUNXI_GPIO_OUTPUT);
> >  	} else if (flags & GPIOD_IS_IN) {
> >  		u32 pull = 0;  
> 

