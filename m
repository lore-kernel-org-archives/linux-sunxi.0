Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB835C1B7
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jan 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528774; cv=none; b=BSG2U3qZoV/n2RdNHPJpAlA3swObLK8MEFnuE5jGXq0vRw9DIkIycY+QclsKlcOCa+ErFUZeoFdMzyP9BPjcz66u91t/dwwZT4HRGxjDZoNbuDNn0jKTN0spM6hcGOZFHDS9vmapWnPY+qL+iHUb935Dl9HQz72VKc6wYLAmZss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528774; c=relaxed/simple;
	bh=lr/AXvpRECteTqgpnXcvrdfrDD3U/+YRtXBlxwKPYTo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WOqGFStn2gy1pHBun7r4hDQm6zpmM7pFrD+8W2OrsUb5oiAHH2KJjHOLk/aMGwZmC3Ooe/csyliciD6PHIVCbxx5GlWe6sUc47QTppbGkFlOID2pY8ZxQRVeG4w4x99s7jGHvQXrquFN1d/phull9XfTiMH/8vo5KJy0x0vSLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SKkDkcUO; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SKkDkcUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769528754; x=1770133554; i=markus.elfring@web.de;
	bh=lr/AXvpRECteTqgpnXcvrdfrDD3U/+YRtXBlxwKPYTo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SKkDkcUOrBYJcK0M9s86Tp2mI4Fswb4yv8jcNY1Gcyw0Me2U/nSZg4mTBgin4Jij
	 qqcNXeopPWALvx372bkI0OqBE3XthxNTriEteAqhoiU2cCEI+NJdsoKkFtHzz5XJX
	 /GXwlY2Pdd85UZuf8f6TV9YTxpm3oS5am3a7d5ZysAa6O0anN/7JXUc2duYXGq+Tr
	 khLVzcU0/ckuBiJ1TwSzODf4QFYLyJyrnOUH/r2GSe1gie/ujibz84CmMceUUzqaq
	 Xh86wBUts3wpvlm+kVyPXXLHfZlWJ4mo4Gy9XMyCnkL4oWIObpLS8HlmHe14MuYaH
	 7qSvXsk2SGbVViwYqw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.251]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwjJo-1vw52u1jLO-017G2I; Tue, 27
 Jan 2026 16:45:54 +0100
Message-ID: <f6ce8385-758d-457c-a11f-46145c048afa@web.de>
Date: Tue, 27 Jan 2026 16:45:52 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
References: <20260127034025.2044669-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Add missing check for
 devm_regmap_init_mmio
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260127034025.2044669-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g7izDTzTZ+9FjXKeDfY+ceUyZ7qkPoUOvGrPvuI+tz7S/lnU+vo
 tQle2MaiV3fCaMWf96IbbdJp3bcZmQlhDH3AhOLukof4JvJZK62gzct2FhSAwdFaMfWq2p6
 l6i74EGz2tqaRIxQztIAadpuZpEH56o9/e8nNZdTE9DFLjCB4GZgYBrPlqM/VdHc1ak3KB1
 IKR3uueD3X5Lo8XT1ALyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MTc6k0p+FL8=;mxnGB02U8dxucqUFytFYnlp2zOe
 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

> Add check for the return value of devm_regmap_init_mmio() and return the
> error if it fails in order to catch the error.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

Regards,
Markus
