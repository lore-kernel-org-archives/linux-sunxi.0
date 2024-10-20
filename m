Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297EFBF0
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397996; cv=none; b=GqiS87OCNd4SsYb6JIBiWWXAl7sFQt9ZZMEskcK3Qx8l00Jwv2HI1SghQr3UOe95Aj3d4AZRxypoIuk9WZXv+lrbJe//jm2+NTC0JMYmeh1Xh0emsEM52jQA1mOMPoLXmUDOIyESHiexIsVT+uWqAgJfIlM3ui/bIojORtXjEWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397996; c=relaxed/simple;
	bh=OYV0ggcr2+0/kvs5wz9yaD96vES5ppcnhPp0nu2ddXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeLhHCDwZ1FeoEdi+clroyCyaRarI7GP0QLxpWVc7DYmzw/cy3kPzLb+xQUH2LnWEbE2t7p+0UVuZpc4qLTen8MRhuioiKxyDsfdkPGHT/YGK2uC/a7BA8OREopPcr0TumQP6nSMs2fCjt8w7KlbU7P0md6CFf55oDU7m4zWL58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRm+7LRN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRm+7LRN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2358107b3a.2
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397994; x=1730002794; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvD5zxUD8sPwgrPuyc+CgRrn6Hv13waPalrojCn8pqI=;
        b=LRm+7LRNRCy03vP9bqrb9/4l49BpdtOuyxLO4UIxtbmYEtjWiUigNkwaYMNIvcbcMh
         5bnm1WoKlpj2Tgna/cQIqpDQLad/t9A4bNuWfKfrSHQuCzJT24KBeHzfXPLu9eQNchTU
         NAQGB6Ty6e6a4rhAPeXnXNGFCIypM9WseVBSaasQHOfgKhqHnkv0bnrjKyIQVCDmpm/j
         b6eOCbMRows/zHVbbzr/ZybaCbkgxKk58/83gET2dtluBmd8Qm+w0mw4cVgU6tyIm8km
         YCE/xGR8fUSWr9yn5kEKrY0nlLpgO84wwQsOf1kyD/4l0BVETho9JFPfFR5MkXJPknt/
         4YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397994; x=1730002794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvD5zxUD8sPwgrPuyc+CgRrn6Hv13waPalrojCn8pqI=;
        b=S9Eaad9XZCGMUuyBhce56+a/E2eN3yCPOCnGcjkt6JR3vEvaUvQdeCtcwhQKxJcO5k
         wTjqwDauSDx4TFx0sDm8cw/uZQ2mW5SrI2eiDjM//KG7yj44s6mXJB0IR/DmTOjp1JS/
         qPxyF2i+7Khvffi5g4F7q9e6nIZXzNDr/Ffa6oC3MDYvD3X9J4lSOuay1dmQji2xIl7A
         AGwWpqRGMCztRskM6pwJ4ATDKMBKP925X+xHn65zTbKUHLzTbeQZCLneskXtgwMiuh9R
         KhEqf1NY6vueLH4eFJMtoSaFavznoNoIFMN8DDO7jQ+IhLZnSi8emcPGXUdg035UgjgE
         ZvdA==
X-Forwarded-Encrypted: i=1; AJvYcCViosszeg+p6n9Y6f7dhJ8QMhSwu3huTU1jg5AEIT6Z7GcG0bccBCLLSqsQUl2knqCuQm54GB1mV8Q2Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/5OpcUwaQnxNLVhGBZFbJV0ukjXFYkyRftlU4rRMp1rS82Vh4
	iNqNh7mQIbgjNs0/s35fvtL4OrctUyjQ0o+6NijJQs3MPgvCOEA4
X-Google-Smtp-Source: AGHT+IEaqtdBarckQ2MLamn5brMtFxndPeCUFri6Du9gBuXr8+fp6GAzR0kiZvvGZMIDLC3RejE/0Q==
X-Received: by 2002:a05:6a00:2789:b0:71d:f15e:d023 with SMTP id d2e1a72fcca58-71ea314d7damr9272975b3a.11.1729397994019;
        Sat, 19 Oct 2024 21:19:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13eb2c0sm508744b3a.142.2024.10.19.21.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:19:53 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:19:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 08/10] Input: i8042 - use cleanup facility for device_node
Message-ID: <ZxSE59Qc_Zp_Azb3@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:58PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/serio/i8042-sparcio.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
> index c2fda54dc384..8f38b6f4ae77 100644
> --- a/drivers/input/serio/i8042-sparcio.h
> +++ b/drivers/input/serio/i8042-sparcio.h
> @@ -106,17 +106,13 @@ static struct platform_driver sparc_i8042_driver = {
>  
>  static bool i8042_is_mr_coffee(void)
>  {
> -	struct device_node *root;
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
>  	const char *name;
>  	bool is_mr_coffee;

This temporary is no longer needed. I removed it and applied, thanks.

>  
> -	root = of_find_node_by_path("/");
> -
>  	name = of_get_property(root, "name", NULL);
>  	is_mr_coffee = name && !strcmp(name, "SUNW,JavaStation-1");
>  
> -	of_node_put(root);
> -
>  	return is_mr_coffee;
>  }
>  
> 
> -- 
> 2.43.0
> 

-- 
Dmitry
