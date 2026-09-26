Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94B37E2EC
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790443291; cv=pass; b=ijECorsh4JsaqxaWnld2vMyoGJ4F5n0Po0djIfOUqqML68wv9/idYOommHn4mLfNJdCBvwlQfySH//a+109GYqfuXOLorPPLULKmc/PoM6lggW1is1QdjAGieu+52H000P7URVsLUHJxbnfwg4u4lavXHKTaAQ2InQhuVsnsCPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790443291; c=relaxed/simple;
	bh=9u4Wqtg4qpyeBT0sOT/aJf74/jMuOahB7RDE+KuTt40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzOHSRgfSsgD63JorAjBKtnOoFIYnXer/JNu1cjU72nAK0QZjT7PYLmLOXiaYJIIUaOaESR4+JvSsyM6gM6++rAOqJb5QH1zSlMP7NjyinAPUbKdSGpn2fsm28ARfEZrAYgsGM94S6/7LytV+2mYlKkRIjDEoapdkAHk9JRl1bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYYI0XY9; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYYI0XY9"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dc0622daaso4785066b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 10:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790443288; cv=none;
        d=google.com; s=arc-20260327;
        b=Pcofznj8+V/2GezVfQ7q+hBbx+XwAldwEWwB3aPcEorv/5QKiDFUegqc5S/h40Ck9w
         0bshlxYn6vNgYoQLcpABCZEdLQ/n8Eokm9lM9eJQgJJbunfqcydDdm97pZocqC7c4IB7
         pjR5KMrj1mz0qLsmWm0UOr/dxK/mlWzHzJvbUSJXuzyPLDu1twAhHMa3qXGrDPbCruf5
         SUAIWhlC8aINOQt2rc0OQBNyWch/APG5CarNAj3TgdUp7TIaXacewQT1KY3+VeIZcKXd
         av9LErVmIPwTFytSqbzqxek1ssvv4/t88Tk5FPwhSkqhN013dVi/hgE0VajzmAGJE8x7
         Dpvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        fh=+i4yQEf049JIDLdedX4+QFX7JH1sMJAiQd8QILSsFWc=;
        b=Kid+9KfyaKK6F/wieHvx9xjpqgmgN4MsVxvwebaHmwoI42mMY0g6bcKIsATbZoE8yf
         54d4GwIuham7NV7PtJsD6V9rxkKyGkDpHEnVbxKpIvwSbShAt+AtbEY+ulhlylHM5AiU
         JvXXHRm4yLCTPEC6kCvpGPJQjFHiez2yJn8lnz/MDzHoSZefEXMxUMsjnrVJRowpJK2U
         Vy4lOG5imZSv0sNGH3h8md2YUFRAdJPVVUSRLLOLbF0jUJKsd0uJZXpGuIhQiEGHk1wa
         93Z9WdfvEn5XEPLSx/dLZQQ/jI6lqubNko3FE4GNhmsdArh+hi7qaFLLFmwhvmoznigg
         6tCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790443288; x=1791048088; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=AYYI0XY9gtpG54nUKAeqaDic/bcZ3gdXmfmYLe9KnB89GpV+2g+KOGRsO6MJR61MfH
         juu2NnAFCw+NS5iGm7NdnV0DRz6MpMM5xNzfoCML20hPUwrhORjF5oeri8/OXvR/xAu3
         ZUEqSbP1ZLqkeIwRpVekEmmKBQgtIHyVfTk14SDApFCGhv+BxB1kRgAUfmW+8xsg+puO
         BrNuOzUznf+xwUnsZYFLIc+fpVYCANLFR7ZHvDEaoxftpSngbSu8/aMErNjPcmrz7EJ3
         pnUAAA5N/pHYRijmvak5Tgc3rdpRddrv5VhAcrR8f+Xji6Cd84CUArBoYYAYoBu4DLSb
         CT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790443288; x=1791048088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=AVholKGRc0S+DpRegytSyi/guCitFmVKZKjHLUQ4bW56RQt51Knr0g20BPID+Syp2i
         UWXkOV9XXm+mggqJ1XSsc4Lq2MZ1DcWK8CpXjevcCl+l7rqM93Xb4Qd2HxS5nxymAz2g
         vUqWFImee177swcIvRhPOfm/HiVymUYBN8j1diW9OSXwcCv81su38FFz1TdlOcceZO0a
         b+eZ8CWS9WcZPw72F+U2w/i80j6TVwJRzls5/4wN/3TfROQCKRRvPxfn9RPGlVGbhHZV
         49TOZaXch4JDWBpqRAr/rrYHZA+vvEEecvrqOdTMypbWhs3HgUJKc+azHxzLlFOXTyLA
         1Lng==
X-Forwarded-Encrypted: i=1; AKwUvBwmgTOExDm9gJ/Hh4ojoL+tFM+NpAQaA+gpstunAVZ+/fmNeiUuv5Sle5PhnMylwNwIb+72sY0bHxb/aw==@lists.linux.dev
X-Gm-Message-State: AFq9FYL3gvl/nRb7FEOiOXxVQK9ghc2PGIihoZaZT6H+VTCjv6QbeemZ
	EsGDLJb3aTIHTnz6IxVvsa8x1+YAQHluTtkZy44wmNcmnIv6ijRn5khgGLuzRfwwlI1IjJVkdQH
	njLGIBJJ/v/yhuEektxi72A/XZiRomwc=
X-Gm-Gg: AYBFou1Sn2cFKFrFucmoFQrkmry3m7av/SDXvJ/YalFozA/QFS8MUeFRyS7j/gPbDKn
	I6CgCgmAOl3MRjUyXNXIpG8nSTWGoud0tRyOnqILE78si6eQ51yPoGazeyIE/Nz/vYdd9MFboLE
	/d278dFD5kFUElE9QDzNi4VTRbXbGH78VqxjcGbACv7ht/FU2jb7veEuLvpEH79Ggf9BIzqHl0m
	Dhn9v6bBl/kXSR09e2kD4QXbY6e+DotSheMuXcGUkZNfnb3Wo30xosldpMkSXqNPpOmRMapbzh+
	1X+baJLWrCbKA6yUxAiRD34vUkwaEchVj3rKsyR07M4cHSpeXiCcMATRMlvAcWX5pu4WPCesMYr
	5FpmRJ6eE380=
X-Received: by 2002:a05:6402:13ca:b0:6aa:13d6:888f with SMTP id
 4fb4d7f45d1cf-6aae1fa590cmr5300101a12.1.1790443287630; Sat, 26 Sep 2026
 10:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
In-Reply-To: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 27 Sep 2026 01:21:16 +0800
X-Gm-Features: AclHuK_oi-zKoshtXCuOOr3CsOX0yKq1NGgpk2U78md_ZK4k1diCt_1GHatAQ2s
Message-ID: <CAAo+4rUpf=e+rVKR4FhTOuGb+xGx+yTz7KOZbrRc29ErgznuCQ@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 1:10=E2=80=AFAM Nguyen Minh Tien
<tien.nguyenminh@embeddedlinux.blog> wrote:
>
> From: Chengfeng Ye <dg573847474@gmail.com>
>
> As &sdev->lock is taken by the tasklet sun6i_dma_tasklet() in softirq
> context, other users of the lock in process context should disable
> interrupts, otherwise the tasklet can preempt a holder of the lock on
> the same CPU and deadlock. sun6i_dma_terminate_all() and
> sun6i_dma_pause() take it without disabling interrupts.
>
> This was found by an experimental static analysis tool for irq-related
> deadlocks. Lockdep reports it too on an Allwinner T113, where the lock
> is also taken inside the HARDIRQ-safe vc->lock:
>
>   [  299.389380] WARNING: possible irq lock inversion dependency detected
>   [  299.411196] c7109568 (&sdc->lock){+.-.}-{3:3}, at: sun6i_dma_termina=
te_all+0x40/0x2c4
>   [  299.419137] but this lock was taken by another, HARDIRQ-safe lock in=
 the past:
>   [  299.426398]  (&vc->lock){-.-.}-{3:3}
>
> Use spin_lock_irqsave() in both places, as
> sun6i_dma_free_chan_resources() already does.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 =
DMA controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> [tien: rebased, added the lockdep report from a T113, Fixes and Cc stable=
]
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
> I ran into this on a MangoPi MQ-Dual (Allwinner T113-S3): with lockdep
> on, stopping dmatest set off the report above in
> sun6i_dma_terminate_all(), and a small test module set it off in
> sun6i_dma_pause(). While looking for a fix I found Chengfeng's v2 from
> 2023. It never got a review and no longer applies, so I rebased it on
> dmaengine next and added the lockdep report, a Fixes tag and Cc stable.
> Chengfeng, I hope you don't mind me picking it up.
>
> With it, lockdep stays quiet on both paths on 7.3-rc4, and dmatest on
> four channels passes while another channel is paused, resumed and
> terminated in a loop.


Not at all, thanks for picking this three-year-old patch up and
testing it on hardware. I=E2=80=99m glad to see the patch can move forward.

Best regards,
Chengfeng
