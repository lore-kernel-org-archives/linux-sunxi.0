Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705664;
	b=4edsBaPtbZQ274KXkswFmCNgZIQpWHbIAQkC/Pd9WckzWG15kMB++DGfmWQuy78IKN7O
	 je/ZQi3v6JTFl7M0rQ/2A7cSoNKzBvgJ/66AwJ6WS/Y3u5HjBfsBPLFRGDYBFmfxzUZ8v
	 XVxrTcZ1DkuxTL+D6XVGcg0MryEMDBHm568ZtcYuozk39a6b/BOXlijtjxEWIAGyFIAAA
	 X+iBXmP2LJIE8BaSPLQr+39IZwnXWwZ1trEryDgxt4C9Tcmi273pmQoDJIjBx6FEigxpd
	 kpEbmENxXppPpZjBvQdqrV1x81+0BcFLyOt6EhWjbvnqdZOvQ0djk9bJHLtkHPhgrQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
	b=ff16S/vBz6n1YQOKFjtkBxt4Yhk+XX6DVkFc+GWZo6itR2pKkDbuxwa4vLtakTbvu9k9
	 Eh5pdQdYiGkuQyT0SdcMj3qOoSTQUEEd7Bhxp3CXlmgEpDgZZXFIDzk1IFdbVoep8EmB6
	 MXHK4yw7Yif/EFN0WJnX942l3wsA5h0+T4FYZitHQWTZCoY/zqzgYOkBKs9yICTMDrM/q
	 fxKsxqTUUEbL68UyrS2CXlnoG1oDgavfzF/AmPgYRM0WdlQJxXhVxecyJpH8xVC20KDyz
	 qMnjU+Fma6CP47L+xJ1O3elODuo+lHc6JjHDe/JQYqOxJKWTj3kzQoEj7MG/wzMn2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zds3XyKm;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2673606A327
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2673606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zds3XyKm
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso172645e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705662; x=1795310462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=zds3XyKm1zmU4oiiZUnFdGrZP0i7RD0mpSe+2krJ5krbH5nOeimCHVdK/LqueXyxnT
         2vFaUAjqbpYPiWKv/9VpyZM3qVyNDOvO7WQodlHUm+u+fr1b0OPOQkPMQzJrjd0bilER
         6LBwAjdL4cKOBq4+ddFyZ8u3nyBeNmW0Odp/WXLv8zw8/qcug4lVMPOGR95TkZsy6yzJ
         VJiDaPydsiqeMFAyCcKj/OUMvDQln1aTJuZD8M9kUNC9mBsBi22w7GVlAgJBcYG55DCJ
         R0wEI05ru9+PYSh2PWG2WQU8tBoRj4oMab8N5YBPJXLwzGbpuCyVxhgbvlItNi/k5sV+
         28Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705662; x=1795310462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=ch9Nyuk1wDGYhkH8Tk7AAKZaN5yVc4Mc5w+jFjRYV9vl0I/8FMwj1dmVBbjWoB341n
         hzjGCLRPi4zsXXSXg/ujNmunZ5AoZQ30BKMSz3UiXJKfzjp+Fo7OqudNblH8JGYxLY/S
         cYLluRS7fXfafchv2J2uu2JfFnOg794UYI3+8Q35+RLp1HuDQ51q76USORr999C4YDXa
         WjRllmhLHF6kjzdL1DinicuzsynA5OSFeamKGFu3Sh/fehhgjK6oXAvEWjDDir9gJsRS
         rqDSDfYx+v0dgxIEhhRqKUUe9WF9o4r3Ifap1QgUpSeWcsOSK0Tb2QhIHuLGGBTGg6Y/
         +x+A==
X-Forwarded-Encrypted: i=1; AL+hErGHTRTg2pCpFRREluA/25Y+TZzuM3kd8UxDvk0S6FVFBSdwKsTl9eeoErjisHeWqxeGtVKRPn0wzFv4bg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/tupI/TXEQzIrB/nFfsRTVKPT6OYXRLJdx5JtjTDnq93MJ+/TJ
	1CVHS0Satkmc5bB3obZ5Yth1fuR+cv9e6L+p34O2EwlZCtV6oAoTEe4X
X-Gm-Gg: AYBFou0zoHJe7jtC9OuRWm7a2hL+JUftOLu7cZfQqAnfkIXG+leiCBSdPSgpWVhwJiE
	dM7/9wfXohHxJWB8vf0PtprHUwaUKmAiwvM5N7kyFiX/jxq30juTVn2BEQKOEqR2lrYyjnFU8Cm
	RMHihyHdLY/H+ntSRgh1if8AWs+3eP3vTQ6sB01zyohncanZsWdIWf3ZCsYbP6uqE/JC9q4Ju0d
	q9TkFfB3ipzzYLRgLapEYr18EX0b4senMwUBbLVnD4W5tWdf0U/W07bK53uxTwAvMmLXzREIv33
	axsrSjoHGBcLj8qeNiiOpSmevQL55TNfpedP4xM4cZgvBTKXMF9oM37ZoincvL3aqW4xu62ePKj
	TrCUPjoM2xMl+ccCKWHClu2bM2LsgqWjq1xAVZMOEKMJP/AZjEXLHjA5gImw0i31tDl9zIvVrcs
	v8NO/xwci0Sy4sZYqN5QHcLA7ZBjsyuMxsD6W9NI6ncRxYrTgN82DF/4vs+hvI/W8bHBIVLbXhk
	yHbYX4Qg8WXC1jTHqrtcLQEsg/4Kea785BBiud1yU0wMV9slAvvFGrAETVsV12O8KvqXEa5UgdW
	Zm1z2EX6eDCscbPiGKqoGu/Xtma6sdRoUAZ/bgzX2rQH5Gvcn0CDoqC30KgLzrDEN5rmWe2f90F
	SJP2vYs94p7jtPZsUjWPn1LWqbiBBIKuMJCFovZJBpZ6gwjJYGWmrMNjZ5rps5UAq/gC+CPn4Hm
	tbZ224gVCBz7vp
X-Received: by 2002:a05:6000:2889:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-49c7072cb5cmr16023280f8f.26.1794705661826;
        Sat, 14 Nov 2026 17:21:01 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net (lfbn-ncy-1-251-132.w83-194.abo.wanadoo.fr. [83.194.94.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm12967006f8f.34.2026.11.14.17.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:21:00 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun, 15 Nov 2026 02:20:59 +0100
Message-ID: <20261115012059.1022197-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
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

Hi,

Gentle ping on this fix, sent two weeks ago. It still applies as is on
sunxi/clk-for-7.5 and on 7.4-rc3.

On 32-bit sunxi the N-K-M rate math wraps above 4.29 GHz, so the clock
framework reports half the real pll-mipi rate on the A33 (594 MHz
programmed, 287 MHz reported), which broke the PocketGo S30 panel. Any
comment, or could it go in for 7.5?

Thanks,
Romain
