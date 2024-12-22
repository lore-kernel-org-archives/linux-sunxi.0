Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954E38DDB
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734886289; cv=none; b=icGBpjiL0oYVn5QAK7IephZmx+jE7ROXM/kW1XUeB5l3LWalKZywEEvkRFfPqPGhbivPZMyOTplwRauHORfy0r33KWJNUOrg5fp++Fxoqe5I/TDJZkl3q1b6SXOy5fsl83m7MV6+Yn71ynviiTuk2xHOf5qqvamQa4Iuva6mkOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734886289; c=relaxed/simple;
	bh=SsbXVSyTcrkPya+YAYeCev286lM8MMbSIv4JlipzZe8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8ZWmDWlS2Yx/QysWpW0VVB2gOacyGsJMY9DyQuQdLaqQriAp0QlpnfY93UgVQdRt2rpA6c2aSb6Z7zMbZ0s0smNMpK1YJ7bqtXq0jJrD1O2OvRualgD69nawEqsrqBlu5Qy60A8Dd1BV+JXaGD5ZIXZbkQeNYMH0QZZ0/5lp8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NT6KX9f4; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NT6KX9f4"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3eb8accbde3so2279716b6e.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734886286; x=1735491086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=llvFAMVKzgtFTmydFpXfdQntLEV5hPHDDyb2zSA1otM=;
        b=NT6KX9f4Tel4wO40LA6uItnkeWj7KFDoQfrBFUSWAfN4DsE1mw2X7typSJwQQunznP
         qR0CtJYVrMpjXybs8gvWgJjv1NNNJNT2h4fFE1XQ6BfjtKQyEsWcaT+HAve2n2JsUlnM
         rs++sihns6vEU4d5nwYBLTZmOcW8o+QMTp2wbylARhyAe6TurfzNe4HAHiKTlkGnTifa
         5LpAnlQLoi5CBibQsUbj1UWM2sQ+1k7XfGtpMES0PhK6goY2pNlhPMx+K32mmuNSgFCP
         bWMO/DbYd6eZMHso+Y+P97wom6l915MwCLtXrFjN5gt/ruuinq6wM3T5Jmp/qKJG1HGz
         Y/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734886286; x=1735491086;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llvFAMVKzgtFTmydFpXfdQntLEV5hPHDDyb2zSA1otM=;
        b=czBttVMYL57+cjA58CQ8XrOYoDqykhL9OXMIjQuJ12WU/9wnnJgmej5dx/QvGzUQnX
         YL87rhn04NHZo6nstYfq+A5ACL++nGMYJIbRJpRtL0f9Ks0Y6wvi6RmseJCNjTGCtBmK
         JvR46EoepSg1PCnvqByIIb8tnmjMPgIrfT/JyVv5bjXsOD+S38xnwA7AvnHa5rXZa7AY
         Jp7G5HFecQZyxnIfIKF7FNRseafiobh+wSNXIQLjvIHEu7/hsV3CP3sP+Y628O1FaSUW
         n7xXJTue2VSQCZFZSwoPE0KFXBZbhYiA+EgcaVfN0++lPMbPFw4toW4THZeHfl4iHZak
         +xGA==
X-Forwarded-Encrypted: i=1; AJvYcCXig73va5oH3uhNbH4KK66i4otll/bIGPgLmPtSxiggpRJcz28TUXzC8uTwPkdY3KuBQknYSntceYlXyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJu9C0dSYRBiYJp88WYxyy7Tu4sQjzPj2NeZPng0DQmXDxVrpW
	eDOG2Jv4vYoluV0Njbx8Mjkipjd1Y/WFM4Zhk3vIxWEKtfgn2qN2
X-Gm-Gg: ASbGncvDpCtNezETr+D+GD4M4y2QsCb5w4fuqKtFboBomiPBulLfFAJ5nWhGUDpQJIT
	2G/rNy6omp9Xev9W2hiZng4QKZjNU8Xe7uwhJ6dUkJzA3BHjTiRKKFCVV0qGMrdv8MKQvhm+G/V
	lhf1c3BQokBpYNk/8ZhHe4tsIgySJn/UJ0ZNsMzzm3V0scRxfy3G7cazbP4QOwqfClj+WqC5Q5u
	wKx3euQ+/kr0SOEyCU+uWlWSYlLyhgAhkKDc4FwE9E=
X-Google-Smtp-Source: AGHT+IGOSjWT5nZh7oa9tWjzH86Cpa0paHAdKsw6pkoTi7D+l+JPXI73dPghgcyucCe8yUcH/SZBQg==
X-Received: by 2002:a05:6808:178b:b0:3ea:490f:da54 with SMTP id 5614622812f47-3ecdd77f492mr8640803b6e.19.1734886285936;
        Sun, 22 Dec 2024 08:51:25 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f4db755632sm1757228eaf.27.2024.12.22.08.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 08:51:25 -0800 (PST)
Message-ID: <6768438d.4a0a0220.399c57.89b6@mx.google.com>
X-Google-Original-Message-ID: <Z2hDjJqf3YH5BEUo@neuromancer.>
Date: Sun, 22 Dec 2024 10:51:24 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221094122.27325-2-ryan@testtoast.com>

On Sat, Dec 21, 2024 at 10:26:32PM +1300, Ryan Walklin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Devices integrating Allwinner SoCs may use line-out or headphone jacks
> with jack detection circuits attached to a GPIO. Support defining these
> in DTs.
> 
> A number of Anbernic devices featuring the H700 SoC use this mechanism
> to switch between a headphone jack and an internal speaker, so add these
> to the allowed routing items.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> index ebc9097f936ad..b4b711e80b65a 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> @@ -98,6 +98,10 @@ properties:
>      maxItems: 1
>      description: GPIO to enable the external amplifier
>  
> +  allwinner,hp-det-gpios:
> +    maxItems: 1
> +    description: GPIO for headphone/line-out detection
> +

If possible, I wonder if we can keep this without the vendor prefix?
It looks like for now Nvidia and some Rockchip codecs have the vendor
prefix, but audio-graph bindings and Freescale codec bindings have this
as a non-specific property (and it looks like simple-audio-card does it
either as "hp-det-gpios" or "simple-audio-card,hp-det-gpios" depending
upon the circumstances).

Also, the behavior of this is very specific to just the Headphone sink,
so we should drop the line-out text from the description. If someone
sets the routing as `"Headphone", "LINEOUT"` the state of the GPIO will
affect the audio path, but `"Line Out", "LINEOUT"` will not be impacted
by the state of the GPIO.

Thank you,
Chris

>  required:
>    - "#sound-dai-cells"
>    - compatible
> @@ -247,8 +251,10 @@ allOf:
>          allwinner,audio-routing:
>            items:
>              enum:
> +              - Headphone
>                - LINEOUT
>                - Line Out
> +              - Speaker
>  
>          dmas:
>            items:
> -- 
> 2.47.1
> 
> 
