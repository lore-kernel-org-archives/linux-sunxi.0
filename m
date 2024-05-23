Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354B78C7C
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716464890; cv=none; b=I8eDiGndDnu3jqPdgzijIywi7SHOGpphvi3p5ooSLVGFum7SMo2+675yIll2CGnhbIMaje7GiTTLryBnfVT3KacZFrgf0Fd+xzB1gfd9vT29b+mDPcd8/wjjmmtfdIC4LOr/KpvZhm46650l9oQKQKNEFuFrCdl4ouahgRD1b7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716464890; c=relaxed/simple;
	bh=6V+8CtsowbR+5woKWil3/uTefTydyG91roAsOsQIUwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcRotJ7Brsv4RpTevL63f7WqpOGJEPCPk+ZWs5T1rez8ASzsfizS4JWOC5U+a2T/WSzCBEFOQ13OILcmKow5xFLvjIn57YE65Fuwi/my+C3RNMOA6D1ddG9UuoIf7+zleqqCxTys8hmqj/cHFLY5tcEN2e4PLLGIuNu2HSPSzXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObtT4g54; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObtT4g54"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-528878c258dso340809e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716464886; x=1717069686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6E61Jxzxjq7f22HqS8A7YYLGqKHl4SecZqgeLR9j6N4=;
        b=ObtT4g54LhwkI1v3Np49gO2oTmzbHfK1MJKrR2lpkLw+Brb/qrxuZfoJUhdmlWBHuc
         xBh5sn2R+RbySEmW3qxhSkZoW7o6q5YFxjY3Z+iNbOXeY0VeWaCHY7SMyta+ozprvqZo
         ih2YSxgOMuw3+3yA+BQ2WPTdc90Ol1TyY95OLTNBaHw4AQAq4o3pHmHBHI5/19lAriJO
         L67KUh/eZD46angMaNZfq6092U8nLMKBv1Opm7qlsTQLHSrWWKBM79v5bgbN+zW2jkkx
         orYSjbf3zwur3WAH0eVHFlUMLinjJnKZpVYgBZjDVnD97bjmLWCrzTEeGAo6CQPysKJ+
         zl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716464886; x=1717069686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E61Jxzxjq7f22HqS8A7YYLGqKHl4SecZqgeLR9j6N4=;
        b=uNuYpjn0Zg/FunoDHlYO3FLP/mTovIf533BrL7IAyGdhJkN7hy8FOY565X1q0gTUtN
         i06/XOU7YC049fQn9VLRd+NMBsqthprSAcXQdLRh+Zjn2HCSskszGwwkbH0j8YA26YKf
         dGtlh9YSYHsFJn1+Wk7McerNACoqieQVBKib8VPWZuhPF0Tn+2nOXJeH5QrjYaBg6KVz
         4S/7aEWV7CoksEllE+wlAKRcVOsqCLsGNp05cGzXYUcEo8i5r+k3fIjJA/U31rok7I9o
         NBzg3w+rB94+kRNhWcorms5+akRH4A7zL3kob4uApbSZ5pI2XDtRmPUhrsFIEIeJCoAj
         h9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCURlZCV1jT2JkxG7GFLW57WxTkDipcdubCYsDMtUMG4zGEEYJcJlfZGmCObSbjli3xtIY5FeP+YY+PJvrk0Kek58Fhh3W8Nvvr7gUE=
X-Gm-Message-State: AOJu0YycoyMA9IG3g4UnwCjEnixvu7DND1veB2CT026Gy10hs9IjBTb1
	0aTu2FlDAXwvrgOEmjTG+eQbDA2xl+63s8FY8jf48ZawkVg9DkbZDbiVJjlOeb8=
X-Google-Smtp-Source: AGHT+IEyzI18nfzrDPezUD9GxCNOdOCNYajNRn6pfAF677xU9i/D+vNI4ocAHpHkdn63Af8sVdouJw==
X-Received: by 2002:a19:2d45:0:b0:51f:30dd:f35f with SMTP id 2adb3069b0e04-527ef9d932bmr566891e87.14.1716464886556;
        Thu, 23 May 2024 04:48:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-528ce560b22sm42924e87.238.2024.05.23.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:48:06 -0700 (PDT)
Date: Thu, 23 May 2024 14:48:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 23/28] drm/connector: hdmi: Create Infoframe DebugFS
 entries
Message-ID: <dflaec5kcwlo2y23txb5susqimiohuvf5uox5kecmbrcs4wnox@dq7xak3vcazm>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-23-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-23-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:56PM +0200, Maxime Ripard wrote:
> There has been some discussions recently about the infoframes sent by
> drivers and if they were properly generated.
> 
> In parallel, there's been some interest in creating an infoframe-decode
> tool similar to edid-decode.
> 
> Both would be much easier if we were to expose the infoframes programmed
> in the hardware. It won't be perfect since we have no guarantee that
> it's actually what goes through the wire, but it's the best we can do.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 152 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
