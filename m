Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461022;
	b=bUzkpZnDHr7MOoFoyxG0MqUuBJRFmVG1GLwKDDHE/fJTYpcKSkC72bJ8sqtgDpygvveY
	 hyY47f2S+gk1SaQx2EEjBH7KAECFUFwmD9mBdw5EUUBBxwlBzTps90/zAm7zR4lOrDsHA
	 G7jTkdoNyqgNLEyqCosoVB8X2Zi5qoS1cEAny6ggYjV6itwgjI7jo4Wdx/SVT/usxgwWV
	 UUVwl1BdX9puHg0rfxFEMmwI8CcEgy2rRoXvx2BfHPzbk5iqIJHNkVajLMJrB7dxSKVwV
	 LZ1vPBwss3+5WvZ7kLEhY5IYLwdu4U3jAo+8EaGhwfQ0pHtSdGLv5H3rYmwtCIjQuQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
	b=MeB1jlusH04EbtuJuQRhQ6ioHq66YELque52OVLFz27LTlYyUCp/Z2dQTZccnxLtLRpv
	 TM/I0lANMKRLTtDs8Y6BoIhSluValoECx/Rj5v5Anvpsc0x/T7Zkc9o3+eckUh5Y5Mdeg
	 1dE1/kb2i3SWiOb4zHWtnPBjZlQgGh60xS1YqNMYAVZs1aMsf3vBgKixYcG/zQCFV7ElA
	 uJ/hWwJcEObr1redXo51Sd+KabZfcgMWnkk4dRkE7YSH2XSPpG6BlgbfjJGsZjuoVb2Ai
	 dNiM/QicxHlQxEqYrvOfncNI1u6y40URCILXCpYqO3lLxJYYa32Go/NVryozhsq9NzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ibpteft/";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03C5606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 01:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E03C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ibpteft/
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35943f55c06so367465eec.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461021; x=1793065821; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=Ibpteft/LRdTTipS3unJpWfYGwoP9NB5tO71qhMJLSzIQU2w0RMbVMtdPxAOxNtGIM
         y8OhboZWgZCp/zynfzMnZ02BhIMSQWLyvUYyD2eDEIszvkMyxqXQO3YYi0XKh4fZpl4X
         Cd0M5xoAvScDb2f9C/B+4Ni+aRANXHbPiarLV2kxcOPRy1tPjojPtnZI/1AEFngsz3Uk
         raba5ds9E72qqpB3ThcJl/lAsKyZSoZAWX/kIov/eMHKSuun/z6DlIvS3Tl969+T2EQL
         ZWjqyBFLU0hlb1CE0CvqUtukiXR8yahMiIhQSr+eaa5MxHcb/4Qa8mffK4leOvICHQ9/
         SJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461021; x=1793065821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=uKqY8bF9XoG/xOJ48uMKGx+iO/OF1+xZXMUpCHfvSynEaC3ybomXT1LMK7gePH1Yu8
         DzKKmKOZiy9DymhY8vJh0h4Qoo5SSYtYPW+OdyHLFTsB5NT18RBi6VEa8eP8Cu9mCnaV
         EUhVSdHQu7WquyeDIT2PGbWywq91JUbWnO4/JZiCjbNmBArhkmTQ3+HyeTh5ufIaFrA1
         g0apm05MSP8UKxOIXxAzENo1EuFj3sFzWujhPH8vw4y1GCCrJEIs/dUG0HZAYUqd2fZ8
         RgsPcHxHPBmbA5g3NqKT3ZnnhQHouA/YjvMMWCS/vNxPggMfMLAbiH78imr10aexffV1
         cA5g==
X-Forwarded-Encrypted: i=1; AKwUvBwrc8gG/qQA4E021x2F3EgBXOySJJXMzV+2NgjZvkrgFBH6d4dG5S5PVB0U5qYRbh7xMwUWpzj0UK/bjQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI9ixqQSAxQAKYVJDgFB+A6JCjwWFpsivIfdh11rH02/4sY/glE
	uP4WJBwpFNxe1FBo4iIEz3LJVQXRGJWYgdrMkoOosDC3Ona+yjModBY6
X-Gm-Gg: AYBFou22GzR+f1ufrDFtd7yVZob68pTe/VKVtnivyzS50MRohitZF2eK0Ua8H69A2zn
	csZEtk4QHQJl6H6CTe2qxZly8LHwaI3GZ8L5Ed7y8vPoMTw6iO4o83e5aFuYrzrAixDJFzIiip5
	WGFT7gVFND21aZg2+TvWvJkDAk4X9Z0Byq1i2Sx53iUKA6pwmV/xho+4F5Csvcjbdijf8QErKFI
	crxI5q0PJwQLAYkfbzVuiOaLD/X/4dxWogjkQcxmbBgGVb5MNmq0TiFuCQr6InmqL8+i226htX5
	AcVEaWuA+4EZ2VMAI3VKLEVEZHKIslrenZXIokA0zCt3kQRBDrBm+yrrouU2asFuInQy4KxJlI+
	UvMBeUbQsqRXeD7wEZewas9ERLdniux4sHhMpKTB06MPSn7Wk1c1wA41eazEorjIMarpZ/AU0+q
	0TQ8zBRPekSQmYG0we7nsR7isc7HiLTjJvmav9YFeLM8IOi7ApPa3fx3L444LZR3vKW9mRnvT1x
	cpxYN1VD3AI
X-Received: by 2002:a05:7300:e7a4:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-365fad8dd2dmr1501089eec.13.1792461020849;
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37187697eec.5.2026.10.19.18.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:50:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <b1f2e857-134f-4bd9-84cd-fa05f43a62a5@roeck-us.net>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-10-pmazzini@gmail.com>
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
In-Reply-To: <20261012100816.331033-10-pmazzini@gmail.com>

On Mon, Oct 12, 2026 at 11:08:14AM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
