Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883293;
	b=PiM6mhB9AasujKVeSyMs2tXCqCzulQtj6uPRfZUBL1Eetl0HxrVwM90inPvwRWzMzi/F
	 7h7LCJZl9nekW2KjSSvkujzfT2E7PrRqz3eIa1leUkpiCf4fTuEpYi7OXrVjA1/UqMPNZ
	 TDSKYrc5y3MkF3P+VHuSUd2H6IQHQECd1SzCboFS4RFPaFfuYiQHKCeUbH8hhlviqbCwt
	 6QEwDBC9Zmq6LXooc6OTBK5c8O3SHG7uJRJbjNQdXP9e0at7RU+cfGAcoSyVvH8GFeLOJ
	 TU470h2C3bXjSVnoUuJcs/17r+mSlpAWBJefjsAvn5Opiw7kd1mKBffpcDY62zxLtdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
	b=doxEANBHozwuApbfaVF/eyGjgXsBJboOgr/wo6ytgQwXdx7YkNvARM+bHjXAiFIVOSOG
	 +30YQSKWSMdsPjEPI6DIBNXNDpiYJ9QsDqmB7EKktAmfGOD5HAgiUBDFPVKgxsBXcqaaw
	 ykBxug3RNd4+e8e+sEhjCTU/mSZX1jeJW307gAQ/ha/GPcxyIz03+Ko89Itp77k8uDWFz
	 tT5DUc93lqlYs1zrcEp3wPqAvqV9gHf9k/ibcFabqvv1EAc3FSwuODqywckW8DXl9oSyE
	 bFQDREJp4Uiyn1aZAe1lRSHPzaJnxuFvyMCkEGhqieneg2WGiw1J6JM/QudatiXJ3kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ini1Qu67;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553E606A329
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 12:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C553E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ini1Qu67
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-825b40f8a26so806392a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 04:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793883291; cv=none;
        d=google.com; s=arc-20260327;
        b=mqR3eddFeAlIryXhcAtXgm3RsGu3CUnnKYYKJhMGCppm44oadPOql+NUSNqR9EOWlL
         7UvTb3bC3aGeU5pUtlmkC6P7tgoaxf48wF/quXjmo94PTPtA+fJY679qfmTzJY4Imj+I
         tSN7cKxw7k/oqeiSIKsX7GYlklA0gl/a5ZVpopPyADMNQtvKIEYtVwXdztGTzcJfpDcN
         zzX2P55lvK33BPstFM2Keb3qggMLGBC4HtmpIg1s/EjFnec+9svSc2b13DWl68OEy2rc
         KqWAiqGnPwLHdpZOPiQsRngNs4SN9gckqeMhjQBGH31MvVmCnPHay0970pb5iSNPYj/A
         HnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        fh=Iynzv78PkEdAECF/JKp8d7q6WHLN/27I9BGbU0hDRzc=;
        b=CgmDA2rZLcs0mFy1SmUeZvzZ4X0At91CB3DsJZ037V2bJ1HmuQn62frKDWaOcrPzVe
         2svBUNgjP3g9c0uh4z2nsgAS8NyEhd57rsOnSw9fuHmuXXcPMUok9vQX4kbzF8qs0LQQ
         Q9UjPiCgxOxXbbwY0cauHpRTGe6GKmeuxacZD/iid3kHZ91KBUFzGdknvi3Pds1iehoI
         tTk3H7rAZDSpOW1WJUrLmMZKLYljwEe0d9hGyNUS6CFgBgN53naM609VAfU5WcH+Wr6C
         zFVy1H6AkLNX7zRE8h4ZwzxqWRvasyv5suSi8VqSfMxfLBa2W/rgxICA/RJ3LkxQrG/a
         B1nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883291; x=1794488091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        b=Ini1Qu676ARz0M8FHBVaP4Gw/Vu71RomFDUYzkcUage8UwTGd7X9l2Dsh5S2U8bvJy
         EcpnUZs7oEntSL+dr172NvQdXF4LKvC+Y9wyOYIjzAkLnAF1tnw8MpStMhRI0JqwLsg4
         iSp7MV38XWZqDyQ4ijBSel2n81Q2crTZ2p+49Xx8UamrA6BCzShrDzYzkE9Vsm2k47Rc
         1ltQpuLeI+k0XW5lX+xsGWE0BLzFH4dgRL8q+i0NGc4PXa0iIgpgp6n2okKMuYcQB7E3
         JC7t63PbTkOnfsIYbJeSQl/rDux/suP11Ff6Ytt3xL9Ip7NPebNq3TKKj6vFdSjPhQvA
         raFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883291; x=1794488091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        b=QaDVWHDJiOurR6Mbw24E4d0gt9T2a5uSuRXLWguyn4oJ1x7p6xDUuBKoL6sVEfR1xo
         InXhL1OpZfig9FA5iZGDsmLGRKzcNlrznNFcijw3TRBiPr8jTf5VkiOxpY+jrsmMETrh
         F1ghO1RrT/c6TMGHeWW839UzSObPZPZ8hTUni5tEQPZGd/M/HM+frzF4yyLRKco0L8bp
         Ab9kwV6TcjZpknr/SSGcwtoR0RyNazzlYE+xOaIeb6LV8wfV5hXsrLWkw95ol9rZI9N4
         v5LKVWrEiPY6L0yy+NLg8DO/QGWt7w02pt6fZa4gdjRbUHgMQRz4N8++aCWLLGj8J1/b
         nB9Q==
X-Forwarded-Encrypted: i=1; AKwUvBysmPVDwnDwTVDAbRWcGGaBdOkRNzoQtSb/uPrIGNBNso5At81fgnzgAxPvFqTU11+wPOxqq7mx//+dMg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9f+7/tWAEc3OvNSZM3Re0u5o0/R6emWU4iLyeeD4Mzd/cd1c6x
	PJ2EWbvxd8ChwCEf3krGPHJE2fPC7eWr1vMuSUXxELYub2qN2PAAM9aFfFMaTccH4twmgfHkNIv
	wSA+1grwohmyb05iAxt6yaafqA1TEYJzMfzYXgQXiJsH8
X-Gm-Gg: AYBFou2wYR1dRU3lVl2NzoO+nRrcANIcD8ox2r6ePi2FnI7uZMXl5vSlMBS25xby2t7
	cq0JfZIQXtV50Oarq5jcqK020Iu/ANoBj9EZvg41gxV9MqPNZvijFMEwr07FjGQHdvHdmX/YPyz
	PzR/zDUT8IK6okjvSNBfjRN0GtP8DlsSj1n8OcAVwCxFZxuR7CVVsYWdsolhYyHOuGeW9Ez4EtV
	X31YXf0RsKtdJPyatzePNOe0nrqKHVwy3qkl6WTlel5JcMFFwj3ID/rxe2LHIyy9kRCk7BIwHbQ
	AGogEk8FK5cTt3F1j0b7BgSIzPzNU3D3FBC0wo57arfKQv1CyprNwAGVdMKHuOF7jta52kbk5RI
	q+zpqkxFzY33YRyI9YrhC54uz/3hiAvxr8HQSQemqP8ufjELMKrJ2EuuwZi0LtVEoRTPqHDU0pI
	y+SL9YX8hTQBYIsm0yFFsk+iNorwDdMzQwQNhekssSLBY=
X-Received: by 2002:a05:6808:6508:b0:53e:3b0b:fc1f with SMTP id
 5614622812f47-5640dc2a803mr13971941b6e.22.1793883291559; Thu, 05 Nov 2026
 04:54:51 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016113846.8602-1-arash.golgol@gmail.com>
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 6 Nov 2026 16:24:27 +0330
X-Gm-Features: AclHuK_mK9V2l6M4jlS75n76fTlhzkP8UIpwt-w6idtrgAnrQy8Zvz7juL15y8o
Message-ID: <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 16, 2026 at 3:08=E2=80=AFPM Arash Golgol <arash.golgol@gmail.co=
m> wrote:
>
> Hi,
>
> This series improves sun6i-csi capture and bridge.
>
> Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
> and height to 16 for NV12_16L16, as its 16x16 tiles require.
>
> Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
> same alignment.
>
> Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
> posted earlier and carries Paul's Reviewed-by.
> Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260527124=
552.33815-1-arash.golgol@gmail.com/
>
> Tested on LicheePi Zero Dock (Allwinner V3s) with:
>   ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
>
> As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
> this setup, so I did not test real streaming. I checked that
> v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
> --list-framesizes report the expected sizes for HM12 (16 aligned) and
> NV12 (2 aligned).
>
> Arash Golgol (3):
>   media: sun6i-csi: capture: Align size to 16 for NV12_16L16
>   media: sun6i-csi: capture: Add enum_framesizes support
>   media: sun6i-csi: bridge: Remove duplicate mbus format entries
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
>  2 files changed, 39 insertions(+), 18 deletions(-)
>
> --
> 2.34.1

Just following up on this series.
Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D3216=
1

--=20
Regards,
Arash Golgol
