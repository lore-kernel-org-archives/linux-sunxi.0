Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A62B8F68
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2+GOjpE5zP3l/Yj2zge3EDzVuoeZQl9/VD1vHaJbzx8=; b=onvz42aaty3fwxg9Ca5yT7zvbj
	ApCgI1YVT0f5FoEGBkWJxsWjY/I3p/YK6pev3OKfqIv4sdqdqnJdP8kYC0PMw7CZDVL50uMQx2gZU
	+DJWKf8jiwN9ZA9UTStq6aaGgInOXUrnbL31TGAs4xLkUAqBnOVgc8LQt5mrFwM++xLlu4Ejohbai
	Ra1YNhokSow9BBIo23A3W6ZKGDhQ649mvu1I4rYyvmgWLeL+0LO0aEiihsvfGJy+E+SsCuNTSlRCl
	wv4vbUjMxyYOHpEfWC3dv5a6PSwas1pRY6AyjBXe8g5DidDpAS+BLa0WswtgIvgQlWQGzsHasGfoL
	S6dHsp7Q==;
Received: from noodles by the.earth.li with local (Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1ppZhb-002Tg3-Ac; Thu, 20 Apr 2023 20:12:19 +0100
Date: Thu, 20 Apr 2023 20:12:19 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Andre Przywara <andre.przywara@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: sun5i: chip: Enable bluetooth
Message-ID: <ZEGOk1isRhaekk3h@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
 <f26d11e613df7bd55822ff3fb7689e36bf9e4f7a.1681580558.git.noodles@earth.li>
 <20230416012421.255bfd19@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416012421.255bfd19@slackpad.lan>

On Sun, Apr 16, 2023 at 01:24:21AM +0100, Andre Przywara wrote:
> On Sat, 15 Apr 2023 18:46:03 +0100
> Jonathan McDowell <noodles@earth.li> wrote:
> 
> > The C.H.I.P has an rtl8723bs device with the bluetooth interface hooked
> > up on UART3. Support for this didn't exist in mainline when the DTS was
> > initially added, but it does now, so enable it.
> > 
> > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > ---
> >  arch/arm/boot/dts/sun5i-r8-chip.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
> > index fd37bd1f3920..4d72a181d8aa 100644
> > --- a/arch/arm/boot/dts/sun5i-r8-chip.dts
> > +++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
> > @@ -255,6 +255,10 @@ &uart3 {
> >  	pinctrl-0 = <&uart3_pg_pins>,
> >  		    <&uart3_cts_rts_pg_pins>;
> >  	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "realtek,rtl8723bs-bt";
> > +	}
> 
> As the kernel test robot already pointed out, there is a semicolon
> missing here.
> Otherwise looks good (dt-validate passes), but don't know if there are
> any wakeup GPIOs connected (can't seem to find a schematic?).

So there are wakeups, but if I add:

	device-wake-gpios = <&axp_gpio 3 GPIO_ACTIVE_LOW>;
	host-wake-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */

then some odd sort of dependency issue happens where the serial port
load is deferred waiting for the GPIO to appear, and then the device
doesn't work. Error in dmesg is:

serial serial0-0: deferred probe pending

on 6.3-rc and on 6.1 I get:

dw-apb-uart 1c28c00.serial: Failed to create device link (0x180) with axp20x-gpio

I'm not clear why it's trying to link the serial port to the GPIO; it
seems that it should be the bluetooth device that depends on both the
UART and the GPIO, and that the GPIO is actually optional so shouldn't
hold up loading, but I can't see how that should be represented.

Adding Greg + Saravana in the hope they can tell me what I've done wrong
here. The LED driver using a different GPIO line on the axp209 works
fine, so the device is definitely loaded and working ok.

> >  };
> >  
> >  &usb_otg {
> 

J.

-- 
    Sex, truth and jellibabies.    |  .''`.  Debian GNU/Linux Developer
                                   | : :' :  Happy to accept PGP signed
                                   | `. `'   or encrypted mail - RSA
                                   |   `-    key on the keyservers.
