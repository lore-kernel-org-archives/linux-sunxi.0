Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE32623BF91
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Sep 2025 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757962830; cv=none; b=oMvW+J3D/JJHN82AdgjriFicDaSoowpY7c/SKEZzt8cM1Z0zvLOZN4HNdp6M44z1hcY+AwD2UlWIa5pdCq9qKBBm/ocMYqtjMo3s8cCWsX0qFF6jSE1tRvs5rNApUwPU8oFcdEv2obgm73QjvRleDCDz0wTCmgckyJmsNI8jZ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757962830; c=relaxed/simple;
	bh=Y6a6sZnzeW2F2Gn+5O0zLJq+HCMmLBinmNAxZ+66w1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p++zDYIj3gqegsKrfg3g+r9whH5NnNJZI8N6YLDHdnTNd8uuWacOpsrAmXOEDOKZ2/mI3PsP2He95apJ7Bc2+VsZVFDS6eKQNOFHqse+PP57RNtKclUR/A1FwvS2/NVQDWM3AE+5g/7pfxzGPn+m0HVtMjuHz5kT1akJpPVsfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=qYwMM0uJ; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="qYwMM0uJ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CEDC8240028
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Sep 2025 21:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1757962826; bh=FiSuNHGevmd26kBGyenDRGXjSi97SCJVo++uujoK+0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=qYwMM0uJt0emo9l9oKVYRQkXmV5TMQ8v2qimaK3ope+jk4wup3FjZE5yAuNPT/gwS
	 +wm81n+/EXK8s7HNFxUin2JAnedb5iPuyEuhvdOwSQI8faKuZ2ySkVjqYqJ9vzng0K
	 sM/PjJw24iIzT1/nZ0jYO4vMQ2MVqwpQWM7lwj3XfaY6/BRRNWy7NCcXevivxsDcAw
	 7hx6k2GYeMjvr63wrUXMPlKfquB92vqAVCjwlNWi15CbxC3+TjTpTy947HdSIqglof
	 fgvYfNrHkkfmUYYfD0pjdLHoSwroMZalIBnPJbYPGQCh4WiYGLC2Eun4jrM23lp0FS
	 HtDq3mypkt6wA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cQZ9N5wG8z9rxG;
	Mon, 15 Sep 2025 21:00:24 +0200 (CEST)
Date: Mon, 15 Sep 2025 19:00:26 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Initial Amediatech X96Q support based on Allwinner
 H313
Message-ID: <aMhiSDKgc7lnv802@probook>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
 <20250912110222.5e4153ec@donnerap>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912110222.5e4153ec@donnerap>

On Fri, Sep 12, 2025 at 11:02:22AM +0100, Andre Przywara wrote:
> On Fri, 12 Sep 2025 01:52:08 +0200
> J. Neuschäfer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> Hi,
> 
> > This patchset adds an initial devicetree for the X96Q set-top box.
> > WiFi, Ethernet, and HDMI depend on drivers that are currently not
> > available in mainline Linux, and I didn't enable them in the devicetree.
> > The builtin infrared receiver produces IRQs when a nearby remote sends
> > events, but I have not checked whether the events are decoded correctly.
> 
> You can either do a simple "cat /dev/input/event<x>", then check whether
> keypresses generate (unreadable) output, or you use the "evtest" tool to
> decode some information:
> https://cgit.freedesktop.org/evtest/

I get nothing out of /dev/input/event0 (the sunxi-ir device) or
/dev/lirc0, which is quite strange. After putting some printks into
drivers/media/rc/sunxi-cir.c, I do see the raw events, but they are
somehow not forwarded to the input device.

> 
> But I guess if you see interrupts consistent with remote keypresses, it's
> a good enough indication it should work.
> 
> Cheers,
> Andre
