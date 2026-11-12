Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470678;
	b=fUxbRuH4PGTQNEwIrgG42kfZgOMjdv9GSI8dDFoWUoPFpxZZKvs5vdyKvy5XKGc6ra1y
	 YoreU2zVuouwZWXFxT6glazeHR/bip5Co3WTyEage4laeofQf6FuQyItTacpDweEERqhu
	 Ud83/mdHn+wvzh1icjwNx0o3O5K4aAxDnGAu9AXzHb8mQATkc6LlEGhXbxZIIhpORDMNf
	 EOvlYx4cbGwUATD35HG9KvYbgRMBgvUvevbIBt7Wi3GJGUObmsj6atwqrSxwFk6RhVoAH
	 tp2zMxFn7WxG4Hpp6u+6H8eyoOXlGaKDd5aEsB7GXn/U6S0iLQC6CXKsnt2P6B9cVPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
	b=reAvBRfhWLmXPupOQxB26n6ez15Kw8QiPujC5UjT5qI/VNN8TnLOw6ZIKI9LiBwsknkB
	 k5XGy93armXrCPAymE+F1miz8ZbZMl6VlvAlZcUKv1PW80Jmf09xrXQtCabR9xHA4jVok
	 l8J+rVnsH/ZVPWM6YKXa2VWuQtemhBqeDkmrOhqjKaS4Trbv5xJGfSbDaurWd82CgO0kr
	 GJx6owOVg5t23h12zjWTy/8n1WLeuCPu1RkMtAhHJuHd9TPR1rjS27uGLqMDZ9tKz6ap4
	 vwQa1ZikA606DXlBy2JzP0i5pT6SYMPW+mTwi8YsTJveDuwCaa1wOihJXMfJL9M0EDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnIUGND3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43171606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 08:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43171606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnIUGND3
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so40257e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 00:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470676; cv=none;
        d=google.com; s=arc-20260327;
        b=EvwayTUzMahq7K5yqKPkL5Rno0jBLRp0Q/LkkJBFRcYNuoNUDxfb1NP1fECJUxZ0NB
         M2pVwigCnPfhMJmiqt/uMaPEgu8S1b5kKChBWB0uZSo1SDZihEJiP7Y7EhEeZE0wWv6D
         M5zcgoiQwH5ReI3q8OYXjoRaOrSi6R8EOQQmhC2Lwt36YFb0DnPO0nAVKmvzPGWEOxjR
         zRZSnjnPAX/sI8E2sX5QHdh997j09AkzHHwnYUnZQ4U/uLCBh++uFiX1wvVIU7qWs5mK
         AF+F1Wzt9mPsCs0l5m53Cqci7GO7vMQjnehkNU5QSyX7FyId+0qHKiFzaOtjCkyobud9
         AjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        fh=hnWE0AyqQWxqAVw79fLwxO5CJB3VBekAYgvUxL+FT08=;
        b=NKBrQzxUdxVbAJhF9urSTlT6MNvxD3K9iAK3d2HXz7hgrCbYJO4kL3T8GUz3Q7a2fv
         1ug3X7zZPpoUuKPuOaEhdHmx4GA+r/UBTy+fgv1L2hV/pdT/mmwDEMmbW15tCQ0K/MoR
         TOK9dm2z/OJVVL9P55MU7yxTNzGRQoOInArMoffLc7CUwLm2kqePkMiRsm3wgPW6ZD55
         kzT/nMDuMX20oKeFMJROhpT9XW7MZy+kxp/DvU7aMaYrHg09txYfVVEgbwiApGV4fl7T
         dQbjzlNWeOkAlxMVrZuZWWmyRKKwwV46E0b6NrHzr4KUI8Mqwmjy1LOpaTc1QOD6BFD9
         NFFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470676; x=1795075476; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        b=WnIUGND325gHugaoNEz0YRBOJERoX0LfSvPBe4tYY28AfYl0QEHcjluhuZHG0Ppe0Y
         etexbNEvTxDxji7Wxq6le+oEUzjz7Xx0hf6DEzjIO3+z3rRvQBfi4350fb2awhEGhjv2
         xXnzL0z1C5QXeWADxI7kyXJtC1jU5WzegW0cTJ7+wox8osRRg8GtqU0Sb9qedUyd2pBo
         +Gl+gVFrD8R9yPGDHTE8ZnQP3aDFnAE1hDqISmoMlvg1j0Z1+NmfPbN/jWeF4e/tlciM
         lDI4UAbjbnleBAeIwt7HOBwUUub2RVXoVx2I1BBYzv0WEVdEJ1EOyJqqWqNcYZYVuJRY
         OLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470676; x=1795075476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZnjmRjaw3mt+xCJw0WA+CLEo0XUahYdWgL+JaOD3TI=;
        b=RDfW69K+O0Zb+eMdWQMgfRkC38Xjf6YLfGfujrG3cdx2NOzadqyw1PKupcfe7vP/UM
         yEots4irQXWyk8zWqRU5nXrW7AQyXv802fOUZNNCkdeT8szFdtOYF8F7M9yzEhSSvN+w
         RJavocwV/rrT2qdE1fqA67JrpymQ8GRUMX1u4jJvyWbNst1awysjjqB/kair6mj6LWTb
         M2zBZy0LfBvlYEwx8ePM4yRMynqJXBfIMhSuFUCinyH+rJGQ2mHDAO2EssrINmrLkOnv
         7DfnHipUB6kmwYv3gH9mu45uVXC9mFq7NygYtUz+jQXaZSa4MfwV7oal1gQD+1y2NoG2
         aCDA==
X-Forwarded-Encrypted: i=1; AL+hErGgPFzdMfsUv5WVw9tZBWhbal8pe5XZEt7QHg22/di1TKyv+D4P+EYUqu9X6s04qeq4nhnEP6xyltmnwA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9gViXq3hA6qBg/br3OgnAriZpkCCLEojfgmcf4l5jQelF6GNvI
	f7qmO+7MA34Wzk5T+/Px2A9SNAnigTQZZf5G34vjfpTkTBfx91YIXYhj0IrOqCAS1m7nN3uXBLI
	4qqams9+/TPX7wPQIXxrFUu3sDhqQwfw=
X-Gm-Gg: AYBFou25FHOP8h+6fvi+Ru0SqwKxB8+uPpQTCiyLoDmGrUUb/DHFi25QnHEskmhbWyj
	lO+sKfVZImXjd8Gg6XRtGxCep07PkTspiXH0hr3mOCqKHfcHcRODhc6qnYOz4C59nnEDPJhzxF6
	sgx5BBEfTVfLv5pgo6ZbjKy6FujBtss07DMAtrL6xxlAdMUKq0nlIE+YFjAlCl5PiAEsHm1jfpo
	8TzuYgIDn4sFMXNT5BqgZKd80OEO8qi/+4Cj+t0cxFVybmeWeEcFQncyVZdmEm45WsTAzFHNQoH
	z/wYBKFrqvQEaMpVvMmMRjDKNv0s78cy/OiYWTPmwxf5ZG/I/UZryEyKJoCOQPggbEYtwMsXuf2
	61XEx+0Z7tCH9dZ1qTgX5ORlM5IPKHmEI5jU8sU5I5FY7j/9CABfuaB9+DKdH8rzXFujoRQo=
X-Received: by 2002:a05:6512:228e:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c15d65ace3mr1565808e87.5.1794470676380; Thu, 12 Nov 2026
 00:04:36 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com> <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
In-Reply-To: <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:04:24 -0800
X-Gm-Features: AclHuK-rZwZBd82aiWDx-zqymsN3quC1b31liF4avq8uA1RRs7r6BZowIVjwmt4
Message-ID: <CAEy9hNUi0EmC4BC=TjpahO=jyKXBnAxHz-0C1KYPb7ZYfxDN_A@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/sun50i: Don't report TLB prefetch walks as page faults
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Tue, Nov 10, 2026, Jernej Skrabec wrote:
> First off, display engine isn't in merged yet. Second, I don't observe an=
y
> such issues with my wip H616 code.
>
> I think it's best to wait until driver is merged and can be retested and
> merged then, if needed.

Agreed, thanks. In mainline the only H616 IOMMU master today is the video
engine, and the faults I saw came from the display scanning out a
framebuffer through the IOMMU, with the out-of-tree DE33 code I use. I'll
drop this series for now and retest once the display driver is merged.

Out of curiosity: does your WIP code map the framebuffer through the IOMMU?
In the boots where fbcon takes over the display, the fbcon buffer
(1024x768, 3 MiB) is the first IOVA allocation, so it ends right below
the top 1 MiB, which stays unmapped, and the prefetch walk for the page
after it fails.

Best regards,
Arun

On Tue, Nov 10, 2026 at 8:04=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 10. november 2026 ob 07:05:16 Srednjeevropski standardni =C4=
=8Das je Arun Iyengar via B4 Relay napisal(a):
> > On an H616 with a display scanning out, the IOMMU reports page faults
> > with master -1 at the IOVA right after the end of the framebuffer: once
> > at the first fbcon frame, and then once per frame for a while after
> > each TLB flush, e.g. while a video decoder frees its buffers. They are
> > failed walks of the TLB prefetcher, which the hardware flags with bit 3=
1
> > of the page table interrupt registers and no master bit. Patch 1 stops
> > reporting them. Patch 2 makes the remaining fault messages say which
> > walk failed and what the interrupt register held.
> >
> > Tested on an Orange Pi Zero2 (H616) with HDMI forced on at 1024x768 and
> > three 4K H.264 decodes through cedrus, on 7.3 kernels with and without
> > the patches:
> > - without: 214 "Page fault ... (master -1, dir rd)" lines;
> > - with: none, no "Page fault" line at all, and no decode errors or
> >   timeouts.
> > Since the patched kernel prints every fault that is not a masterless
> > prefetch walk, this also shows that the hardware sets bit 31 for these
> > walks.
>
> First off, display engine isn't in merged yet. Second, I don't observe an=
y
> such issues with my wip H616 code.
>
> I think it's best to wait until driver is merged and can be retested and
> merged then, if needed.
>
> Best regards,
> Jernej
>
> >
> > These patches were developed with Claude (Anthropic) as a coding
> > assistant. It investigated the problem and wrote the code and the commi=
t
> > messages; I reviewed them, and they were tested on an Orange Pi Zero2
> > (H616) as described above.
> >
> > ---
> > Arun Iyengar (2):
> >       iommu/sun50i: Don't report TLB prefetches of unmapped pages as fa=
ults
> >       iommu/sun50i: Print the page table level and status of a fault
> >
> >  drivers/iommu/sun50i-iommu.c | 50 ++++++++++++++++++++++++++++++++++--=
--------
> >  1 file changed, 39 insertions(+), 11 deletions(-)
> > ---
> > base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> > change-id: 20261110-sun50i-iommu-prefetch-85cc9ecff559
> >
> > Best regards,
> > --
> > Arun Iyengar <aiyengar1990@gmail.com>
> >
> >
> >
>
>
>
>
