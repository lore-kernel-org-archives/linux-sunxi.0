Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E772874F6
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Oct 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722101; cv=none; b=uQiFZw7YSYxGEeJf0D8m9dFJ81gZP7YCElDze3m/43WdGedk34KP4CmpKdTgs1ppcvkfBJJbCH783IUV8g7Lm5chj2ZXxR1Hk8FLRAhe5ZtkX88Nw0SQHSKY7z+asEfujj5/qCXNicNviSrazv6Y5Q33VJlT12zhRUqMtxXTNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722101; c=relaxed/simple;
	bh=qyYR3u1cIsoY+f+qFBkbS4RX5FjC0boVFcoghA/JdZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMFNiKBmEMDKzp30HnXjRuOC3V70a2fGy94P6S66E3L34b13QKuWysre1Di6Vya38cFGavB8bi2SaC5a4U0Lg24MtUVr12HYfE3Vg4O031vcOE/VFjH8npRE63HfzKLCScRYo/NnNQXT4vesiYD0ubpA7Cf6xh9+mm7m0bbl9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=US5ZqhHR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US5ZqhHR"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b5c18993b73so372424466b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Oct 2025 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760722098; x=1761326898; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/LnHWob9nzzNQY+Bzluas2ZobwZyvhYGtP6TS6rzlnQ=;
        b=US5ZqhHRojLhsdT75CphznxPEEZyUpzVOBv1N3r08f7rhvL1ll4vpLWKbVzN7YoHho
         KeREeGPpUtrmc6RC4IGP5nRPZavS0tI4cpCkfDg1si2einH9zj9nyipVe3h92KKK/Fbk
         L43bN/Nz1zqNrK0KKA3RjW+ClHjfVU6+2avu634Gn2C3C6si60rPmIIKOt4Gk3bMwqzi
         I9T/Ml9FDrYt3GUAeC5wQ3xqIlRquAsdhBLzF7JJR0MQURZw7dwM8NUcry3olZUHtOpp
         Zlfzc7Mxzs7S5GaAA/KZ17kPMBM09dH9PAsl8HG6pP/wMmAZGjxPRJnQiWr05uKhb9Ue
         XmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760722098; x=1761326898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LnHWob9nzzNQY+Bzluas2ZobwZyvhYGtP6TS6rzlnQ=;
        b=TB58Nw/x/JLDqMF/imJYFTv2TOtbFfkvyVhoh5Bmu6Pk/KZ/CJSDomASa21YMPd5oi
         th8Gt2rRan8hoSg61FrySavQJwxjEhSCcDLBRT4Ejr+VOvaWZS3nxp1aUyIaxmGgAZ1Q
         7gSqQ7+nDxQkMbhpb0Kzd9m3z3jz37ZamAtV7IQPp3qNJSyCSV9Cb5yAgAaiZnZSKyjm
         SBe0HF8J6oIPhj0BgBMZVvx9fBnAaKWAQjA38y90cSgV93sz0lkHO/8FzUoZ9GF4eoKQ
         EGU3xtr6aQHIzJePjlXaVPOyJMHMIaIPMbXnQ8y8RkNPnet4QBnjRULLrMzR2stdbYLA
         CinQ==
X-Gm-Message-State: AOJu0YzmnszTrkaP3Y6eVnRbdo5eT22nc0nbrBiSd5ACE9lGkiVWHKwK
	GF2MzM7Fzi2g0v6/NAzWqmHY8wMWa9MaxqBJE5YuNSetJJR1JguUz5HuV90qbOQ0ij+wX2v71Rb
	STQKxyUx0dj8poBW1rsRb/X7+NfGgQwM=
X-Gm-Gg: ASbGncukUE04oFJnz5wbM9quj4DhEbhJ6fnlbMB9Ud0Z6yz7JvtwI/iGYLvI5rC5yAo
	UwCB0B0cGHtnyy5dK8aCpIZNlgGOsAwwWEtK//ca5erh7UWpSaONXbukkKzIPZ6zH3I88Vyu4Fw
	BzEwMT0LJTUy4c+DsgJOvAcXT1/17JervvYdCUSE1C0pJ8SYK8Gg/pUQsgPFs+lKaykx7YUZ9g4
	Wjv9O08BsdsGfQCMNOOqnT+TjaZQZ9WBmljd9Q78lw8FPSY1k8x1/ava7p8yFJBhaJt/RwuY6aa
	QFD3VuAiTZ3aUdRqmdIFbGdQB51kWHWgkluYQnQlFPeLTFbZaLkt6fFfvVFujuZBAVtC
X-Google-Smtp-Source: AGHT+IE+TLPzx6z62F+WWxy/sGiGmbqGJ3pHUUxcxkWDZaKaLUyOW/0XetR2jvDXVl91JiRfNGPYxsPROPW04Rqeli8=
X-Received: by 2002:a17:907:7ea5:b0:b54:185f:359c with SMTP id
 a640c23a62f3a-b6473149643mr547455966b.16.1760722098272; Fri, 17 Oct 2025
 10:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827075017.1583168-1-pbrobinson@gmail.com>
 <20250829153124.55f35ac6@minigeek.lan> <CALeDE9NQq+7yxEQ3v6KB=2OK58+MC-923nPr1tbxaw0vEcfMAA@mail.gmail.com>
 <20250924105627.27b32035@donnerap.manchester.arm.com>
In-Reply-To: <20250924105627.27b32035@donnerap.manchester.arm.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 17 Oct 2025 18:28:06 +0100
X-Gm-Features: AS18NWA3VdY1pjbnVX2k8kW8v1i68gZiJRP6DMTj5iyV8qwfaGT2v53Kdpttbis
Message-ID: <CALeDE9MF6KW=zs2kiuLf5XFEgB=8JUp3ufyiAmG2DvtNb2jj3A@mail.gmail.com>
Subject: Re: [PATCH] Allwinner: fix booting on a number of devices
To: Andre Przywara <andre.przywara@arm.com>
Cc: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, Jagan Teki <jagan@amarulasolutions.com>, 
	Tom Rini <trini@konsulko.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"

Hey Andre,

> > > > Revert "sunxi: enable MMU_PGPROT proper page table protection"
> > > >
> > > > This reverts commit 16cfccda4dbf0b53473b8212897f5c63bfbeb6e1.
> > > >
> > > > This causes the follow issue on the A64 boards I have including
> > > > Pine64+, Pine64-LTS and the Pinephone. Revert until the issue
> > > > can be properly investigated.
> > > >
> > > > CPU:   Allwinner A64 (SUN50I)
> > > > Model: Pine64+
> > > > DRAM:  2 GiB
> > > > Insufficient RAM for page table: 0x5000 > 0x4000. Please increase the size in get_page_table_size()
> > >
> > > Mmh, how did you get this? I just ran mainline on a Pine64-LTS, and
> > > didn't see any issues. Are you running on some specific setup? I am on
> > > GCC 11.2.0, TF-A is some v2.12.0-724-gf745e004a, and that's with
> > > pine64-lts_defconfig.
> >
> > Fedora 42/43, gcc 15.2, binutils 2.44, TF-A 2.13.
> >
> > I've seen it across Pine64+, Pine64-LTS and Pinephone.
> >
> > No special setup and I reproduced in on the vanilla upstream checkout
> > from a couple of days ago when I had the time to do the bisect.
>
> So I tried this with some gcc 15.2 from kernel.org, binutils is at 2.45
> there. That worked just fine for me. So can you send me the generated ELF
> files (u-boot and spl/u-boot-spl), from some upstream commit that breaks
> for you? And also the final u-boot-sunxi-with-spl.bin? Either for the
> Pine64+ or LTS. Could be privately, no need to spam the list. I would then
> try to build something as close as possible to that, and compare the ELF
> files to mine, to spot any differences.

Sorry for the delay on this.

Just tried this again against the v2025.10 tag with the latest Fedora
43 toolchain bits and still see the problem on the pine64+.

You should have all the bits here
https://pbrobinson.fedorapeople.org/pine64plus/

Let me know if there's anything else you need, or just ping me on chat.

Peter
