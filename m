Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B8158DB1
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Nov 2024 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390920; cv=none; b=lcg/BBOQOksrsUZVIw1w+q14JRlm00ii/XYBWCbeErJSJXJfScY1BeLLM67qzcVZKvvGzoP0hX6r/9M/Bhh3mtDc4aLI4j1PRLuCG10UK/063sd0rfWG8netdYtC/VOs9v3GpEAf2Hd9diejUfqTJOcxFGXp7obyo+pEoVjvkgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390920; c=relaxed/simple;
	bh=aoQY2AU7Sy7wBQvaEt255nidnwU9PNtGmfIdrAuRdOM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3AO9CcQLs9AYzUqRiqoQ1FY4b/4IDrNwxmQPlnXaW0K5weODy3PRlLp5UgKcyU5sPth9BxN5o14FPks5bGV25/lgjQSjFzRteVdIEVaJrS3zKOgByFTnxZYCL/DtEjC3/XX3jA7dWuaTXqJrTxOAClU0CJqfLdh2f4GxNMk9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id fe29a33f-a9d2-11ef-827a-005056bdf889;
	Sat, 23 Nov 2024 21:41:54 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:41:54 +0200
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
Subject: Re: [PATCH 15/18] leds: sun50i-a100: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IwAug906PT4Db_@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:21:06AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> The error handling after 'err_put_child' has been moved to the only goto
> that jumps to it (second device_for_each_child_node()), and the call to
> fwnode_handle_put() has been removed accordingly.

...

>  		ret = fwnode_property_read_u32(child, "reg", &addr);
> -		if (ret || addr >= LEDC_MAX_LEDS) {
> -			fwnode_handle_put(child);
> +		if (ret || addr >= LEDC_MAX_LEDS)
>  			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
>  					     LEDC_MAX_LEDS - 1);
> -		}

This is a misleading message, what should be done is to split them:

		if (ret)
			reutrn ret;
		if (addr >= LEDC_MAX_LEDS)
			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
					     LEDC_MAX_LEDS - 1);


>  		ret = fwnode_property_read_u32(child, "color", &color);
> -		if (ret || color != LED_COLOR_ID_RGB) {
> -			fwnode_handle_put(child);
> +		if (ret || color != LED_COLOR_ID_RGB)
>  			return dev_err_probe(dev, -EINVAL, "'color' must be LED_COLOR_ID_RGB\n");
> -		}

Ditto.

-- 
With Best Regards,
Andy Shevchenko


