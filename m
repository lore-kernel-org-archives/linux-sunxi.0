Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792792680;
	b=4qDVBrG0WzeqOsWjVs++cbedhUP4/5r0m3byBnIB3hXw9+pQu5v4Pmi5/QbRwTPaCHrB
	 DgAo3MWwTFXsrlEm94IKyYMQrUl5bgpDe9GfcBYRas0QyUKgXRSfm/8XxK1aBnUkIrmSp
	 lx39J9b7ZGMGaGzgkfGF32SMhtlv9IgIWhR6sB3BZ1hvACYKHGbLg7tUr0uu/euS7F+8R
	 MdAmHqbrZ//CAs1hkzfe2uPRcPJKF1Wel+DOjCprcmnRtiyjrFosWAaZDqW9IyWg19GXL
	 t4f+LIaS1kfQFH7P4MF+QPHy/hyQFS5lqjcmJ2C8juQ4AmGOFcaCVUA4GJnpnPZy3YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
	b=yQY1GwydU6XSXujViO3JUopTAUFk0DpxuaSHc1SQ9MxQSSgA7l0tnPfOplHDKYzVOvWR
	 K7yI8nvbTV76jJojlxQV5eypG3Z8A2KH3dM5l/HPihdjjVh8uqfbrQ1wTG9vaM8YC+qb/
	 yaMNb+zKvYbe6qD3sGPhlWUpblhsvQfF1xuqN+d6Lih5RKW83Yk/pR69gpu09KMUs7R2J
	 9cGi+aFB7ZryrLi7qewX/jEvzdbCqnOcWIVIni1jEE09Im6rUHgPocuoWSJ5kAd46fFp/
	 QiQ5/QpBdG/oPdrKmEelxcG1qQWmpzRXLWf71an9MrTafoAvckU0OYC48c2RQNFVxsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CGC37uJt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F47606A31A
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 21:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F47606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CGC37uJt
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so583412241.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 14:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792792674; cv=none;
        d=google.com; s=arc-20260327;
        b=K5VtVzK1fFCVoKS8hKFUv2D+mi6T4Mc17AvLtMS9x+ZYGUd8SrLJUx4zylAqmXRRek
         17zxrnvb84Zi2qzhX7W0oBA70gVcTDRl/cpxMDnUeD5/gIJbM7qDLuth6Zmh4bPd8H3U
         0fBq5mbFxaOI4vykF3S+OozYs485mWvMCcNZUo5lzc1OWZ8PAPw0poHt48y2UNIY+9uT
         bmoP1c324uTvzD6lmUPubbllq0vEycyf/153iJG2bRxvddx86UZgVzUWs3w3hvpnkqIF
         cL0NNJJv3RO0JrbV5+k6nibDABB6d0+IJyMxzvk8qZvHGgiVKvEXx8H6MUL0mdqq5tzc
         ucdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        fh=AbndziAJnhTo2OvTQe4/E3O65lm8/ZCCNuJ+SJHzKD0=;
        b=rps3/0+Ij6O+RTV3dK7Jr24g4Tytbg/JcMHdSm4Y2/Axm8q6/RU8/Joeytcvel2KQF
         dGVImtMY2ld/UzzSs1l9DcA7qO8JHd5jx9VAhPz2MfkVRuwvl9/jx+zSxLazxqMsJj44
         HSjYmDcqFi/Qesp2u4z7xXZiL88OitRaLDazsyfb/jyq7lv8FOm9p1L+vzJ7tTQrB880
         z5GaM4xEvluZqEKssEgGrS4bCJ99CdIG+vkaZS3tp8FXPuOB8TV5EAwx/vtei2lBCzbO
         s6GafwR34VlaiEYrb4qfGLR3kfDapUB2mkwtl1vlSjBEAZm+Mr1ayDTdhPXx62tsco66
         l9uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792792674; x=1793397474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=CGC37uJtjfkywflnIKZ5YCIXuXBsMNA17Zk225WcUS9tL7vqaTVDxk5pWiC8/GCna3
         q8ePzCC3cZolfoyOOe63e+Im/wJ59+AXtgM+IP/wEaZmip6mcgXK8KK0OWJ590iWeq7M
         GvIQoMIT6LVgSLBYS4l0QvUOagl2qpwP6DCeuSnJSuWDIobm20oSi6AE0ZZgIAxczX5D
         aKC/dr395XZvRfscEJc+VjEOHuOsYd8SlkfajAH+GJY0c2byXPg0cK6CUeJKpdrJkWCK
         UIS8FQMq/JoHQb0WtHRNbgcRIfbRpvZzi3q3qD1HD+0DONAQCpLz/XsDGrNP+/UoYgTI
         2Xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792674; x=1793397474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=PU0QhM3jLxhyHu3Ww2SSM0uKDmRqsI3au4t8J3COsj0m3YLq/JktVK5f+kcU+gUk8Q
         lX0XnjqxJsu1bMK+oKTH/NUGYA1RZzjxyBkmqgQd2dxqHQ4ZtwOCgU2EktAi/aFEYBk3
         OyXUqFbL1wYkh2KRk5kSFY8mFfNK+KZYciRl6DE/Z50EhDxrvDj9R1hMLLqpDuKZ0DYX
         XxZ7inTmR9awBPg7UUmVH6K5v5xeRJbRIGuBk4NgTc7YHZPiDvhm0EyaBiHr4gYApH1s
         zi+YPHT1dfUE5oEze0T15NuK1ke7Cq1cKBnbrXyG6Vj5q97RUjHwGlvTSdAkZD7yl5bQ
         wTkA==
X-Forwarded-Encrypted: i=1; AKwUvBz0ICBYYNNF8UUwPmZ7IaVxcQfw3oMzE7ow0lwMiLxVMHh9MwwEV4C45c3aUR4pogUfs9ef7qenfbvRkg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIl+zOSj6lVmegnfC8Ojufil6liZs9gwz7dRHUvoAmhOmAnedRc
	hFt2nNIQadL5sTAh32yPHzHQ+cgXKcvwRf0tDRH2lbKDaVggae4HPY5D6rY1c8Q2xRcCQSfdHon
	MNutZ3cAcPbzjxGQWjndH2k4OfLFBA0k=
X-Gm-Gg: AYBFou0bmXiInxHIZQStxVX6EJ3cu6RLMseZWE+pip+M+EqgTL/IPCARKBWTKQ1JNG2
	CWiPngep44Mu0fo0+SBSlY3uRx60uJTbjzaWi6/QToHjdvcFZ3BNszoqbsbZnTG910eiyuQWAaF
	F966FVL8YuTGs1K41kJ0KYrnKcSZ8xFYbfwIpsnsKRTQ7STK2UKizgY28d2cG65semLUyIXYg/9
	bVC+oKhry1jq0VuUqyscBga9W5JqYZB540kPzZ7qTsuU6a0AHs/Y5NG5a1SfY9K8FpHuh6tS+0h
	ymtnt32yg5Z3xBYsTvDTveEQHWhMxsY0mr61j4iqSxY+OKqisp5fe+k2ZBkMcMZzhQelY7ZF3cu
	E7IVy+1rz3CkzySap7Uv0qsSX1wHFVbesCuFcjOF6czBBpZTEO4oE7xctW9N8Ufr/BOJi0u6kvu
	Rwl4TgXfyQRvOHRVdYc2BrensHH94VbIF3k1q3vVqQOv9nLhzIMDYwV342xwP8oVWEC5BWaD0ct
	CFS7T+7Zx2e0QsWg0KWRW/IvJ8FjN2X0xGOQvnz4LC55ODPTX8=
X-Received: by 2002:a05:6102:915:b0:7cc:9d82:61e2 with SMTP id
 ada2fe7eead31-7ce5ccddc23mr173507137.13.1792792674222; Fri, 23 Oct 2026
 14:57:54 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com> <atvEczwQ8Xh9vcAI@SMW015318>
In-Reply-To: <atvEczwQ8Xh9vcAI@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:57:43 -0600
X-Gm-Features: AclHuK-L8Ck-SoXzjLhjbFwPtYn7ao_X3XL7jMPxi73vlDBLmOhNQMuoUPfGIac
Message-ID: <CADvTj4oF7ENRHQRk5VHVN2nuqxV-+4ss5BrwDvijmcS_HZ_fRQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dmaengine: sun6i: serialize channel reassignment
 with interrupt handling
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, 
	Jens Kuske <jenskuske@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Chengfeng Ye <cyeaa@connect.ust.hk>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:33=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 12:42:37PM -0600, James Hilliard wrote:
> > The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> > termination reads the physical channel before taking either lock. The I=
RQ
> > handler also takes an owner snapshot without protecting it. Termination
> > can therefore miss a new assignment or detach an owner while an interru=
pt
> > is about to complete its descriptor. An IRQ status snapshot can survive
> > reassignment and be applied to the next transfer.
> >
> > Use sdev->lock for physical-channel ownership, pending channels and the
> > shared interrupt registers, nesting vc.lock inside it for descriptor
> > lists and cookie updates. Allocate and start each pending channel in on=
e
> > critical section. Read and acknowledge IRQ status under the same outer
> > lock, and protect cyclic notifications as well as ordinary completions.
> >
> > Clear the active descriptor pointer before publishing finite completion
> > to virt-dma, whose tasklet may free it independently of the allocator.
> > An assigned channel without an active descriptor is ready for the
> > allocator to start its next transfer or release it. This replaces the
> > completed-descriptor pointer and keeps residue queries and termination
> > from consulting a descriptor already handed to virt-dma.
> >
> > Mask and clear a stopped channel's IRQs before releasing its ownership,
> > and clear pending status before starting a new descriptor. Schedule the
> > allocator after termination so other pending channels can use the relea=
sed
> > physical channel without depending on another device interrupt.
> >
> > This also keeps process-context acquisitions IRQ-safe. Client callbacks
> > remain outside these locks in the virtual-channel completion tasklet.
> >
> > Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A3=
1 DMA controller")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kern=
el.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> Is it possible split to more small change? And you almost add sdev->lock,
> any place only use vc.lock without sdev->lock?

Yes. virt-dma takes vc.lock alone in vchan_tx_prep(), vchan_tx_submit()
and vchan_complete() to protect its descriptor lists and cookies.

sdev->lock protects physical-channel ownership and shared registers.
The sun6i paths need both locks when updating that state together with
the virt-dma lists and cookies.

>
> Frank
