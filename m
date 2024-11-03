Received: from a.peacevolution.org (a.peacevolution.org [206.189.193.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E818452E
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Nov 2024 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.193.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730650994; cv=none; b=GQbpy2g1bYzAmt2NSe8VlkaES+XW5qbzQJ+BUQzEPk3cOs5l8tZwQLMChnR0Nbu+LY2xe8OWUczoA28UG1Tqcr0tg/yzoAqAgk3X/p3+me+thDxCNgbvpmAqOIAOJ6F7I+h2qbBdUAUXAHthlN+ruDeKi9SpXZ1zG/1+x7ple9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730650994; c=relaxed/simple;
	bh=Th3OOXZJfsZuk7HXCZ7L6IU6s2r0I+j2t7q7eIgzWNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mE8QVSrlXz7+VdotEZOEVfShPwv/64n7FDSSPwDJRRp9Q7BFUNmbt105N0GXxcPxbsRyEL1LJo9XhfvlJddQLDMewFDUTMoTXJVni4WJRV0MpATVwPCYAxpxlOgq2pg5JuHmBNOzswj/YgyuaA90OexPKKlchnUEQtqwOXFHNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=WmOQ1duW; arc=none smtp.client-ip=206.189.193.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="WmOQ1duW"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id A69264C891;
	Sun,  3 Nov 2024 16:23:10 +0000 (UTC)
Date: Sun, 3 Nov 2024 11:23:08 -0500
From: Aren <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with
 devm callbacks
Message-ID: <iyasbuxwpgqeeuaimcpnycrze3xg6u55uusfxnvy3i3k2ejy57@lbrrc7c3r4fx>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-7-aren@peacevolution.org>
 <20241103112208.233f7180@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103112208.233f7180@jic23-huawei>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730650991;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=je3uCAcHsGiyDOgvqOvzEM2tjCfi8IWbvFmZvz9katU=;
	b=WmOQ1duWnvM+PHINwEcVOHgkXZK4Gu49qiTEWLXeIMTTD/95JdSpVS0QcU3as8OuqLbPA0
	4vz3fZ7Jz7e2JgJIISbRBSCnHvGJhOECg4IO3GkWuibDZjDsncPb2JZgLwL/2Mah+Uj381
	pqrN4ROz0kl2cw9L99XRu7qgNhuCrGc=

On Sun, Nov 03, 2024 at 11:22:08AM +0000, Jonathan Cameron wrote:
> Hi Aren,
> 
> > @@ -624,7 +640,7 @@ static int stk3310_probe(struct i2c_client *client)
> >  	device_property_read_u32(&client->dev, "proximity-near-level",
> >  				 &data->ps_near_level);
> >  
> > -	mutex_init(&data->lock);
> > +	devm_mutex_init(&client->dev, &data->lock);
> ret = devm_mutex_init()
> if (ret)
> 	return ret;
> 
> It is very unlikely to fail but technically it can.  Andy has been fixing
> this up across the kernel (including IIO) so let's not introduce another
> case that doesn't check it!

Right, I'll take this as my periodic reminder to read the docs / types
more carefully :)

> If nothing else comes up I can probably tidy that up whilst applying.

That would be great

Thanks
 - Aren
