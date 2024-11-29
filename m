Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857F45C14
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 04:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732853659; cv=none; b=frQn4Ogo9LQjd7omg2C7BIQ5DoQWz84QA+KkmHfOFEjVavtH3Hx3upbtwHqi0vSDDRtPx1o6g2sYtgMKpFROAg1TyPYiC3jlAGiM0sx6Lttx0XGi5J/KSLFsPc7Gdka/TfY+bjNtd92vTaWAAY0gljzkhZWFotO/IxagErEIpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732853659; c=relaxed/simple;
	bh=7Q5uoccyOFHjDwzni9s1pvqhXs3JznPJtn8MoISASRU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XPKdXi+iCiSG98grSs5cUHc/yAaV06F2XV7/p5KusSuTcGRz5GGkPm/VshIW3YHmrY+/B0cEU/PEHjtlOHJn8HnFcdXr6U4Vbv0OGNVCBhoshoK1GGMs4DordaAm9z+ZB6ZKLmjDqFUmBxkvHeey2+kATI0uoQSFPBOMmaaWM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=f3ErCGcG; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="f3ErCGcG"
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id Gm4yt10vtqvuoGsOQttcWu; Fri, 29 Nov 2024 04:14:10 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id GsONt92BO5BVrGsOOtErN6; Fri, 29 Nov 2024 04:14:09 +0000
X-Authority-Analysis: v=2.4 cv=Qv9Y30yd c=1 sm=1 tr=0 ts=67493f91
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10
 a=a9eFdPKkdgbxhWDV1dEA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Q5uoccyOFHjDwzni9s1pvqhXs3JznPJtn8MoISASRU=; b=f3ErCGcGBfb1iyOQo+fcBv1t7e
	6gIj1pftIjig6fL7tveuQjbhA03eV/QcD+R5rWTQe8Kn9b8yRm0dBILPJMeIAtcfUfaokPCf8bEQi
	VnM7TkIpwvFLSw3xj9BQhyi6Gh69ZUuRR9boclxSbWyPKx5IifgE+g3dfVaP856rdqNtazS6Wz5YF
	JpmSzV9RSZH3SLtqW7qKwH+Fxg2hykOB0b/Lml5yUanGNm9nRgIDBLwLO7zu4QpPtTIwTZsg6evED
	zsR5Vc7+gG5Tkk1K8TlzyM6VmhDxfJBgYFDuuJLK0ncSsuEditRyf0gLS4IJzvUb11IMcRspqyPew
	2Zwa/xSA==;
Received: from [122.165.245.213] (port=53154 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tGsOG-002aNG-2V;
	Fri, 29 Nov 2024 09:44:00 +0530
Message-ID: <fa7dbac4-592e-44f9-b468-834779fdbbc2@linumiz.com>
Date: Fri, 29 Nov 2024 09:43:55 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan> <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan> <ZzNCsFiAiACFrQhE@titan>
 <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com> <ZzPluoI7xSTwhNcm@titan>
 <2ef6afa0-2756-493b-83a4-62e73a8e2af9@linumiz.com> <ZzRgP7-hHWE8JH8K@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <ZzRgP7-hHWE8JH8K@titan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tGsOG-002aNG-2V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:53154
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCKPCXiUdlOSOO8X4/JIWkmvRQrkxnEVKrjA1CzbIfmdG4w4lUljTz0ZBJCGG77rXG1Z9ruiST2UgYHE5xXvO4bv0TQQMIkzgxuddVPWB7MUp5Hf56iK
 lXf82KpZf5qUJP0i14P0KfVhJsOacs+0bpp/FJrWsxO4SE560lqkCZTZlx6Qt7nXBViqCWTuWm+tI0kfK5RxsxTDbO+v2SZr0ds=

On 11/13/24 1:45 PM, John Watts wrote:
> It really seems like the code means mixers here.
True, I was wrong about my statement. But with A133, the case of independent DE
is unique, which I couldn't test yet.

> If my thoughts are correct, this would break use of mixer0 and mixer1 at the
> same time.
Agreed. But back to the original discussion about setting 0x20 to the port
register, it work fine in my end without that changes for A133 display pipeline
with LVDS. Not sure if the reason is independent DE.

Thanks,
Parthiban
