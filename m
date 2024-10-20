Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30C5228
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397371; cv=none; b=mbjm2A+9EA71bEuWoTkg6ug5s+cZttqe3GLgwUg5m6CHYq+6vIc4o8ptaAwbMBGPpco6HNYVYjjbHB/yKjE4TaWbKeFFeiQaewYNTkl5SEfmL9qbm/Is7rlAtTlWglHR+peSOBMWwwfnh/+bbZwDD7YmJh6wRBWxmCm+LU0Ui/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397371; c=relaxed/simple;
	bh=Z12vYrdNeaaYXwLkKZ54l2s8GJThK5tqZlFL7APNBhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peWRupcaLKQN1UegY8xBNdMiG9AQMqqTVALYegvVMt5iJ/POG7/0bNTRSbE2MaZHnMsoTvmD44QX2ZPvniYOOKbw1CQUiOp88/FPOY63LgBo9DQ3M/C7PA2VYgu+cqhEqdKzyql9TNtZ8Cv8BYtx2qjJw8d8jO7Gyr8J4jW6ltY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pnu3kJcw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pnu3kJcw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71ec1216156so226331b3a.2
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397369; x=1730002169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTkQOWt01yI1NE4iVB+SDk4vWmptzzQ+PpISRYB8H3U=;
        b=Pnu3kJcwwNCPvk77RGBjoLHDY+HZYNfAW8ynUnebl8yFSH3zR97StOJMJ2Jv6sJI74
         BtY9iIA1v/Jg9Xa8ArKxz28usRv37re61t+u7kTv/BatrlmLnRuM9sRlD8dcOm0fpBxt
         HL3LCIsdxAy/1TwYkozrZW2aciTyZKwl//CN1KWPijdARqwQxxqA9lF5UyPvoMUTaZk1
         lXKtpGUWMzFK2B/mqtKDPMmTpZdT8iAYMaclX/oGspJZDoEUIctavYS94UoWiYtILVtD
         RxVcBcPmJZ+ACByLvGkAe6pPM6Nt6Pw/KYga/KcqgqvoqOqoPT5fQm17OTsf4YldYJIx
         D3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397369; x=1730002169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTkQOWt01yI1NE4iVB+SDk4vWmptzzQ+PpISRYB8H3U=;
        b=mF49EQAr+InWdMk6arTtMut3KWtx4VD+1ADcE/f5OTT1l1j4NgyRqOMYH/ppoM3yQM
         XiHKpIyI6AtDo25X7pBMT/RciKfW34i6zLzaqOjhvQx/CvgvWWqtab9MHj6rcLfkkv7h
         Ku3FIOBYXQA7K4Ie574prb/KT2CcVd7nGlxNHP1SLPU7oC3y1uZ9L1gyI9OgpR2TvyOu
         FjcAEAL/lTIt4Jn4Yeo96jZ+l8KHbtP2ARruI3yqoj5AA0xK1WOEirJJ93NEgcbjUVyu
         roCL/xmDtgSnj51URiOVqUs30ybpd1WvL6iYc1NYfwnQiHKjqgdRs3olZHr990Rk/gYK
         cB3w==
X-Forwarded-Encrypted: i=1; AJvYcCXxq/erPttfYpIZtpnr5NyaA7CRsly1njRA8Mi9sI4mKRjTODfUqQIuuoFzd7zv/WldHHhSa1SjS8kx0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWTkLgoWPsbD9CMuNYmih3rs58RrgICruR9YzVdJTWpgu2bGDW
	eU61ye5keOep3gFnAEoaYfNKXM8s4ufN7yEY2rFmpAiGGxW85xyj
X-Google-Smtp-Source: AGHT+IE61r7LzTueKUQlFdoI5wEeGAqGUwYYiMrtwf2Mv0pNQVPEzR9fOanjd9e8cCB88vfjJr2CIg==
X-Received: by 2002:a05:6a20:ac43:b0:1d6:97f2:71b4 with SMTP id adf61e73a8af0-1d92c4bac83mr11107951637.1.1729397368861;
        Sat, 19 Oct 2024 21:09:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313988sm493398b3a.22.2024.10.19.21.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:09:28 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:09:25 -0700
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
Subject: Re: [PATCH 05/10] Input: twl4030-vibra - use cleanup facility for
 device_node
Message-ID: <ZxSCdYPjv13Rv_JV@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:55PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code by
> automatically freeing the device node.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/misc/twl4030-vibra.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
> index 101548b35ee3..b8ec5c7c5bce 100644
> --- a/drivers/input/misc/twl4030-vibra.c
> +++ b/drivers/input/misc/twl4030-vibra.c
> @@ -165,15 +165,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
>  
>  static bool twl4030_vibra_check_coexist(struct device_node *parent)
>  {
> -	struct device_node *node;
> +	struct device_node *node __free(device_node) =
> +		of_get_child_by_name(parent, "codec");
>  
> -	node = of_get_child_by_name(parent, "codec");
> -	if (node) {
> -		of_node_put(node);
> -		return true;
> -	}
> -
> -	return false;
> +	return node ? true : false;

This better expressed as

	return node != NULL;

I made the adjustment and applied, thank you.

-- 
Dmitry
