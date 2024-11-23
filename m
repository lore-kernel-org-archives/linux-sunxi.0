Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE16D34545
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Nov 2024 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732391263; cv=none; b=fUUIqou5qGA3ddcYwSrgtOLavTtzASnFdfFoqlbtHfNKG0U77zcf2yD/Znjh54k5x14mAfZff6I5YsMNAMDLl5um2U0NgAxrpwSa9DbQM7J9KLpgdknP/TK2kUTmOUEVgwjKSWdU+c1qN4D/IpF8BJGZkGqGnlWrE/wVK+o1p4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732391263; c=relaxed/simple;
	bh=m2qLnqDWjiQs3VDlXncJpshue+oltGe7BCDFQj8lFzc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXjqGgw1nQi35GyLgt7dDYDS3/RRpsQxyFsAi5SAuu+fSe3Y2OjwOHgNp2KdsVIrRku7+43H4na7WGVS8b4K41ZgX3qM+zWXCbB9soQYMI3iE9H6inrG430Em0xumV+bqoEHJ1sLDXSywYcGbaWIvEgpcZAfQGIk4W8inDe21nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id cada6636-a9d3-11ef-a0f6-005056bdfda7;
	Sat, 23 Nov 2024 21:47:38 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:47:37 +0200
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
Subject: Re: [PATCH 11/18] leds: max77650: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IxWdV8ZWhJ5Pp4@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:21:02AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_node_out', as an immediate return is possible.

...

>  		rv = fwnode_property_read_u32(child, "reg", &reg);
> -		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
> -			rv = -EINVAL;
> -			goto err_node_put;
> -		}
> +		if (rv || reg >= MAX77650_LED_NUM_LEDS)
> +			return -EINVAL;

Again (yes, I know that is original issue, but with your series applied
it may be nicely resolved), shadowing error code. Should be

		if (rv)
			return rv;
		if (reg >= MAX77650_LED_NUM_LEDS)
			return -EINVAL;

-- 
With Best Regards,
Andy Shevchenko


