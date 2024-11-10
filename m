Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E3013C9A4
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731268363; cv=none; b=Fp1Pd7AYDeRdT8UM7CxBRrdD9R21ylpAr0iM7P48vV38ViLw9LGlcKKsY0NtI134oPJUwej0YLaX4NOSI3DmE9AK0JiEyBnM1rJw03voxdDm174amPaTzTunH+rHoy2HFKZr6p774y05SSrEttEeJoQVe1xvPnaG4FH9GPl6x1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731268363; c=relaxed/simple;
	bh=9Z/pDoqd+qplmP5YdyAJMIIHWDi+W2hpCCQf7xbBy0c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqL65iz8OzjDKTPKRaKy+7l570lu9sZa78dpcfe7M/ic7ZBGVZFKYlvRTz6ejFX0gddAoF7uWjrt3XM0767TNbMKA97n+ZF6ayB9xLb2me/72I3bjcT+dOTPJAYDGDb1WyPWPYiseA8pMSjibMSPyTPg/voRUP8KvWtfg8SxQaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 5376b6f1-9f9d-11ef-8874-005056bdd08f;
	Sun, 10 Nov 2024 21:52:33 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Nov 2024 21:52:32 +0200
To: Aren <aren@peacevolution.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <ZzEPACoblmcQD9yu@surfacebook.localdomain>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>

Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> On Mon, Nov 04, 2024 at 10:40:16AM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 02, 2024 at 03:50:41PM -0400, Aren Moynihan wrote:

...

> > >  #define STK3310_REGFIELD(name)						    \
> > >  	do {								    \
> > >  		data->reg_##name =					    \
> > > -			devm_regmap_field_alloc(&client->dev, regmap,	    \
> > > +			devm_regmap_field_alloc(dev, regmap,		    \
> > >  				stk3310_reg_field_##name);		    \
> > > -		if (IS_ERR(data->reg_##name)) {				    \
> > > -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> > > -			return PTR_ERR(data->reg_##name);		    \
> > > -		}							    \
> > > +		if (IS_ERR(data->reg_##name))				    \
> > 
> > > +			return dev_err_probe(dev,			    \
> > > +				PTR_ERR(data->reg_##name),		    \
> > 
> > AFAICS these two can be put on one.
> 
> This doesn't leave room for whitespace between the end of line and "\",

Is it a problem?

> replacing "do { } while (0)" with "({ })" and deindenting could make
> enough room to clean this up the formatting of this macro though.

do {} while (0) is C standard, ({}) is not.

> > > +				"reg field alloc failed.\n");		    \
> > >  	} while (0)

-- 
With Best Regards,
Andy Shevchenko


