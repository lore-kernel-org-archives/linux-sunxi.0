Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8087080D
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jan 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528289; cv=none; b=nfq+L5h4kvjDqpWqc7TmgGmGAk+56XzQQcQFrC6aNKdk4SyJIE2wqKeZJlCeiverUG7jniikkOo4ca+c1PEmkNVCwDCYAd6mb6pJUYzOEd7miSj1bnVwj9n1IPHwRonlwRmXJ1pR6ec2sZ4ZlChxP+wiVnlrg7wNRzJa7nyPiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528289; c=relaxed/simple;
	bh=lr/AXvpRECteTqgpnXcvrdfrDD3U/+YRtXBlxwKPYTo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=o6U7GW8x+/i8y2Bg7dgg05dBEET41ciMz0DetUY9BCeMXt41U4wA2A6pCS1SLAFb4+vasKCoXXdydByJhv0XeX6qajeMtoK6GwVlB45MzlPRlEdLcjBGhXxxenRDLL7SPVZR9fzVJ1tHEdf4EUquvB6lQhQuvqoyLVlfGq9tOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=em5RBeMu; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="em5RBeMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769528259; x=1770133059; i=markus.elfring@web.de;
	bh=lr/AXvpRECteTqgpnXcvrdfrDD3U/+YRtXBlxwKPYTo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=em5RBeMucTKqqbj/N7h/2UnsKH6DxxGUTwmfmV+hYKk0Jstb5uEd1IvE+FeNlWOC
	 2uD1ra042vw9QHYjIkgl9VqJOSPkErpt2201G2GqufWILM9Vnx8O/96UZli3pY82i
	 /l/SPUgiJYYJbEYHiXGtBxXOoVGFX7didkTbU3oQv9RQ2/DBTEbnOsQWDKqIgRFEn
	 5PWdyYCHuxhWn6h1/YDzJUoC+Rg2YJcQVIWEevo/kQZ0qsx1j+wTx+RdCHGsD7z/V
	 Lw81cbbUVngh9Qfh/jzsQTX4n+XARavVohwBKvV3qM+81DUvC0Dt+3c+U7jZXGyGf
	 BnCbqY9w0ojZ1vqEsg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.251]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MadzU-1wI9sX2ApO-00l5zR; Tue, 27
 Jan 2026 16:37:39 +0100
Message-ID: <a08213a4-6dee-413a-9f88-30ab5f846a05@web.de>
Date: Tue, 27 Jan 2026 16:37:35 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260127033250.2044608-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sunxi: sun50i-dmic: Add missing check for
 devm_regmap_init_mmio
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260127033250.2044608-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VHCTORnxmEy8LCQ194z4Yo5KSTfOwYP7SZgHY3Fi9DlkLLL5bqn
 OI811kd+0zsYES7HEzeOew1/X/eckCmFJlE49wgNSGBSrOsdok5skshhUOdQ79wl/ZB+5po
 0pe/Z5UFY72BVbBwSns2Ws+V2sZVy/AcZd+Lh+hcyjVgR3ywNfhmS328dVQJFzhi73qEg9I
 bR7VnP0U+CEq5XYsQbM/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pbhSRtV/Ezw=;MUzWndk2kRHBujeQRjiPF+kpRPl
 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

> Add check for the return value of devm_regmap_init_mmio() and return the
> error if it fails in order to catch the error.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

Regards,
Markus
