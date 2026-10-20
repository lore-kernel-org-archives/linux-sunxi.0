Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460966;
	b=d+sCcuQgUrE/OWYUqTkgJwmRmHj/xPNZ668X3lIsxwlR6RpS46ETkqTCdA4g7ptNQMi8
	 b5a1d5c8Hb1If9QBCEpnWLx5KJfNZcYCWZuPZhP9Q7cQUsx26bX17xS3hghCy5CfRvqlD
	 EvrfxeRWGD0Xm+LdEDQ+/gmkhg45XyJrXfmAMoOPXRInfrAhcKh3Kk0hoVs77aDnjhZE4
	 uPsG72JCVogrSEVfshSjqyJjCgNzMkRJkQPUhGJSKxzgAUPWploev5MBLK2PF2n0TYFfK
	 dYKuc8+rP5Oe5sLQAXC8iZvCr2nBTG/bZYJqX/pDaH8Vmh+70Sy3UKxUM5pqReoAOQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
	b=pVrsrwSso9Isjf0osaEcyZEAuoC9NoHnsBRzxIWzbZQuKcpXLtmr8a2IcRm0hW1stOv/
	 pq/gTssMxnZFzS/qGbMYGBJ8qV0UCYok25fo03w6gGha8iLZL3ourFJl0yxa1SlV2nDTJ
	 Nzc63J4lhCmSaC0yXHk9UNXVAG5+ajWJ5UhGTMYTaymW1HUWGN+99v85rmfr9jHWriPln
	 oasrG1LXNlUCOR+Fq3Z4B5sJrEBpkyhLIKONEkIhKNMNmOBS5QYDSk50DmEA813tY1s76
	 frt5d4LPrIFevDgsANfm3RQ/XI67YqPnT5izhq1kziOpYdNHSRYtutSAFkBs1CPCAXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=THFSznus;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0B606A31B
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 01:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=THFSznus
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so3240722eec.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460965; x=1793065765; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=THFSznus31pmg0zBhA8Ek3YP1hurunMEIbkAPLbsruM1YpeAGYcA7qU2+SWcnbH7DT
         Iibodjwn7We3UoWy9IKkmvyd/0gLT4Z5+MxoRrc0nxU2VbGfbFv7e1L03Zg76DQxc952
         WiChVzYU0p3T3HxCVMjnRU+Ima2FPWGO9+/UzEsLTn5/sVp2/1Y/ENCpYzjxMBXgIxgM
         pX+a7xLoB+HyCFgEujL+yF1J0sPbF+BjGV7odP1qxnkHVu7e+GDOi5EIXdKHPUEG6KS4
         iGAH+t1TjwISrlgriDE0vdiLI6Ao2hJzo/lkoMiUFBBovvdyJI6a2bimPNLgPvL7W8wu
         8q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460965; x=1793065765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=CW80Sgmu7nIGFNUWnElz6A3wm5ZqfFHhTIMvfvbE0OcjTCV4oRzk5ZTDEXje5qJqqk
         oX9hXhXy7cmzFj3JkLUAcd7KLe0F7fVx+90vdJBa+jEOCONrCz+3kYtDmZy+mAVFB/Rp
         PBqPQPp02TDjPCbHEaEI3ICCBMu86eASnY54c+P0eeqVgAOq8nX7pIskuedqyajgYzR6
         L8HPNQyQMemSzwdKpXR/aGtpyKtIJY347fr2qRzm8RTchUisbkxHSY4Q3JtEslRCk9cV
         X6F0oPuKzdDzrT+MZlNncyUEVpSyA76H1P30Vhre7tfPx/cjK0dIJzvkq1LHQu77mx9A
         6VpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd3wU81byBE3M2bIemWSk7KwKNhocu+jqf5o6POXs0gYaYbbsYTirjBX+CwBa110kQkptjgaGRlKdgKA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJOuTQAWQeAmNj996By4BcLQQx4tuRgOf0OWbrQE3ctFTcW3xix
	CqbOt+oPOyQVfq7FLFqNHG8Kgf37VAVTyJG7IGGaJ825xUzCqYYUR2bg
X-Gm-Gg: AYBFou2wO1FhPH4co9KYQaWI7ji4hVi+n8B8CHSNpSLPb4ei/U0/7ubPEfOH/+Q9GG2
	U8DISHhHVxZqHWmfNNBwXgY/qpOEwFXCBKzR2C6FbmA/abAxFte9MQczSMYU8diu+JjSIvkZtMT
	i43UW40P9Np6gurEGADbtbIj8WUjqPwtWjdfcncnAW65GSS9Q9DHBOFo2tyCK0Qi2DC+fgQimv4
	aFUS/8Hgt0RUMcQ0DysqDfA+u6uiQ08y3SjqkUbhsyTU7CGTBhQwyY8s+DbnZnTFQgE/L+5vDAH
	xUOF7g1z54VsLoQBfty5vrAP8gqoEnrxM+E/iYHyZD/mGL1pa0S0/7E+WF1Waiy+4+S1E8RyiZK
	ONqFT76DLembcfYhKmn7opOSA7OFTA5Q4ZNvfNhDZJwnU9yjY33ruAPcoJbbwx8oorfHkXEaR1Z
	Ru7b6emgBeSAvnCksAMwdgnaPFFtKpwt3gYCHuZyA4SgCzec5onH7E6FKzv+8Iekq6RWB0jKclN
	zSG6Kj7V3xk
X-Received: by 2002:a05:7301:271c:b0:35d:b452:902a with SMTP id 5a478bee46e88-361a2942d31mr14312652eec.34.1792460964928;
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm33941191eec.22.2026.10.19.18.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <0ed8c1ac-1f9a-4cc0-b914-6b245f86d296@roeck-us.net>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-10-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005202731.153971-10-pmazzini@gmail.com>

On Mon, Oct 05, 2026 at 09:27:29PM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
