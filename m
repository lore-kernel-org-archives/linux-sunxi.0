Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0A19E961
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Nov 2024 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732391165; cv=none; b=fyZ6zuPMkkpHr1eQlwEhsqNjqHpm/m49++TmYK/ejTt2jbxEQPd/CI10I2JXFa0i1AyAowbMgEoFnTisJ/nsLOjH5RkzouhVXmnDTD1UdwHLmiS3vZ0kTStZWLEbiKCiVGx0zaUJ8KJ8C+hD3qZ2FLxKTaSJmgyCmz+rftUMuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732391165; c=relaxed/simple;
	bh=JGbbr/jKwz0H0T6gVm+rr13HbI3X/GF/QKdo2VRJGx0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRO9EZlk8PrxV10wiT/hEeDAyOZBRksLgeuT5aQcBFHp7rO2epqMgZ5zcO8kY5wSyWrrirhnL4cNmIWZmoRs5E+q0znuAkt42gJKAfYpC31JB78MGA0XtUngppRxpEjF37vN2WKVhpwTmT+Gp9v16j8bjWzUXGBTBTFDTjeH9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 8b65e59b-a9d3-11ef-8881-005056bdd08f;
	Sat, 23 Nov 2024 21:45:53 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:45:51 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 13/18] leds: pca963x: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0Iw77gpGgIE6fLT@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-13-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-13-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:21:04AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err', as an immediate return is possible.

...

>  		if (ret || reg >= chipdef->n_leds) {
>  			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
>  				child);
> -			ret = -EINVAL;
> -			goto err;
> +			return -EINVAL;
>  		}

I'm not sure how interpret this message, but the problem here is the shadowing
of the original error code. Hence I would split this:

		if (ret)
			return ret; // possibly return dev_err_probe() with another message
		if (reg >= chipdef->n_leds)
			return dev_err_probe(dev, -EINVAL, "Invalid 'reg' property for node %pfw\n",
					     child);

...

>  		if (ret) {
>  			dev_err(dev, "Failed to register LED for node %pfw\n",
>  				child);
> -			goto err;
> +			return ret;

			return dev_err_probe(...);

>  		}

-- 
With Best Regards,
Andy Shevchenko


