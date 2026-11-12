Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494013;
	b=ToL1KclqpyGGVyNQ9c13MUeowV3i5S8vvdo7MQIh6p0KRf7dmzUbqBFstahsl7S4MHaq
	 14P/RPxjFscSuEhVyvNRR1IMph383Ap9zca7VxDV59UExFtN0OHvUVMX0xAWhxs6N2O6p
	 u1gYobPUCZVO1u2H0GbjNGjc3UxqfTVEdGpcEJNHgP1FvPi+3FWaVV9pDt962X0YkGpQl
	 VMwPCXDO0dv3rxSgVGfcWbVLVnPSTeDU/Kl/sf/J9yA+Ws6fV8XZ2dg3Jj5UAPn69WHTZ
	 6T0LmQN3PSImnGi410J4eN0hRoGCcmvbk8Cw/fbd3RBOthS7h5k2qdAI70qYTwbjESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
	b=Y8lLACNBzggWsFyLcj820A7MOYECOdLIL9H7+fE/2ZKH4Kz3KJAkijJf0m2ciWwdgkBQ
	 TWY6yFzdVjNC2TGIs4lFmn2vfhfjjq9C4IXqr+h6jNelopK1NnOeoc+elIUj/1R6IQ+gO
	 zp5IugE7z4Xc5eFxRuFDlEAPrgxLmMh7RRIUTYEMPXjhJ9mhZZqwoWPFvpl/5hykplysp
	 z7fjotoI4ND3+kauHGvMFuuPjkEvUDQh/WEiUH7VNVZ+nD0xZ2cz1vTa12e5VKNJM+2Jj
	 nBvDIoo74z4F01NxQifu0L02TjAgtR3lGc1HljTnluodzngpDIGEBN46aHGZ1w/f+9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bw+ONdiH;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F4B606A88F
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 14:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F4B606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bw+ONdiH
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2351421f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 06:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494012; x=1795098812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
        b=Bw+ONdiHhM4p2T5sY8WiUY1I2eD6OWi/eyh+pVdUv4SieLp0Ke/iP6opCxYIYhlN01
         aEvpiLCRaIDWTFM4Ipe7pQ5GPr2T3dZmjnBfGGX0HBGetwBnjUNLhbdQ2ivRKDBTA1RQ
         6Uck9ABADxM6/BszM89YS21Bim+qjc+PCIRqsmFdwb+45BUxYvxPhS3sDvgvTIVkdTkp
         DVOfsvqC50aFVSd4lgRQ7UbkRH4snciohFRSy3JuOiaakCYadGLEpKkxIBu36/CN5FTb
         Df9yh88Oup9J7qQyAd0s47DCrIStanZkShD8d41yWctbb3syUbLtYIvzZPS1p1crwrHE
         aTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494012; x=1795098812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
        b=KVf8e6akwDkYHqksLE6KJf/Ra+EZiW/SXoGYFOdXHuUIGChlue/DootLn7umtG6NHn
         ItUYWtfGC+P69INFJqDLs1rL9S1HnAiSYKUMZmJZfP0I/3+xwKUx4600mxi/FDA95zsd
         n6kAkuza52VY6e/lsbsJJDFi5mmtOPBhDd11RoxK1/i6V06SnhjYd9rUgLk9oFvP+x5G
         IDTcK9KDC2aWEkBEF/r6cT+FsZSc1boDCu3D43JFDM0VhUFqXO0WdkAau//eFPjvGdiK
         UtaTwS2mPiBjIGDBsyj7i13IW2GyqXsnyhswtoz9z6aysztA/SHF3tP6EuFL1y7aUxvU
         SHog==
X-Forwarded-Encrypted: i=1; AL+hErGUDATDFoLpieKcZDp9sPEy5Z4cuOf5ylWmsaBkZmLraPKievT6F/tQVqcgBlpIcIt6b6gW0yCM/pYC+g==@lists.linux.dev
X-Gm-Message-State: APuU4Z88m8BJhUAPHMjTrxDsnYG/739MpgowGodGM1d6wK7WwRhtsqeZ
	/qSTGepsQ3jNflN4tNDVvQVpRwwwoGFBrWec69OYBLtsnkdJ1IpKbZlM
X-Gm-Gg: AYBFou2XOWO2fY7YRwF5floibev/73rNNvQh0gOZ33ziLVTa17iHQkZZPSWZOtvF/R5
	0dBqb60kHoFq4lz3s+a0rDxy01OcBil95PorEVh82J0gzk4wZXn/oLvLcwzQ63YoDB7O6VsgM7R
	8htZD3ucnHiAKbhCjeu9UKoKG8AKi+9lp0tcBEsXI6roMxqGbBG21zV9j3N1BaaQhr1dIlcZO4K
	JCnzGeuNwmhLLfocwY+ExZf2It1M4rYl0dtBKZEd+qcyCXDnIpuTItfruvSBF22WAcgZNl85IJz
	jHw707K7IB5F9T0bAJab+t1eMAR/tnXvQoiXWQ/N8aAGWe1SdlCK2fenF/DvnmGM6OK7O58Xq/+
	zvHbmtpfDcrc1o4uk/E+CL51LKX0cOmmxTYdkQvzCiKACpkd8VEJeMnJsUzNPkQ48PE8FH7qD7p
	MxcvDTK15E/5nuWuBxw066WpvrRd7K6MX4Fc3S+hBxXFQjrvdkyObiWRKRA8hoSZ9ACp2Bg0KMX
	yrIk4WxbfBlDIjSCEOPxREKFGZEwyFOP+nrHJRC6d8mL0NsTonMXMptn+dwWsLqPkwuulU46nHf
	XtXJUkDM8J8CIV29fBII4d63vej55y60MJuGGE2MiMSW3uc9QiCiQSLb1gSsrNsyEkB1n75MaCC
	+/Ym2NjYavfdNNwvyjRerserR
X-Received: by 2002:a05:6000:2008:b0:493:8847:841e with SMTP id ffacd0b85a97d-499c8982608mr10751462f8f.16.1794494011369;
        Thu, 12 Nov 2026 06:33:31 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:7c57:d4:a443:9a65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm15590804f8f.14.2026.11.12.06.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:33:31 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/35] drm/panel: drop the orientation workaround from get_modes()
Date: Thu, 12 Nov 2026 15:33:30 +0100
Message-ID: <20261112143330.2576419-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026, Dmitry Baryshkov wrote:
> The exceptions are sun6i_mipi_dsi, sti_dvo and the Tegra DSI, which get
> the panel only after the DRM device has been registered.
> None of the in-tree boards using them has a rotated panel.

Two are on their way for sun6i_mipi_dsi, both A33 handhelds with the
panel mounted for landscape use, rotation = <270>: the Miyoo PocketGo S30
(ILI9488, panel series at [1]) and the Miyoo A30 (ST7701, not posted yet).

I sent a fix for this gap on 1 November [2]: sun6i_dsi_bind() reads the
rotation from the panel node, a child of the DSI node, and sets the
orientation on the connector before the DRM device is registered. It
does not rely on the panel driver, so it keeps working once the
get_modes() workaround is gone, and it skips port/ports nodes, so it
does not mind whether the board also links the panel through the graph.
Tested on the S30; it still applies to drm-misc-next as of 12 November.

Could your repost of 15+ take it, or point at it for sun6i_mipi_dsi? It
reads the DT itself rather than panel->orientation from your 23/35,
because the panel is not there yet at bind time. I am happy to rebase it
on top of your series if you prefer.

[1] https://lore.kernel.org/all/20261109160706.2272332-1-romain.tisserand@gmail.com/
[2] https://lore.kernel.org/all/20261101203406.1360656-1-romain.tisserand@gmail.com/

Romain
