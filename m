Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A672580D2
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905248; cv=none; b=jnghew9P5UXugBuJpEfHoV29Ev7nBStP/I82QFctXEqG0otdlRUNtPGXIOeVhE/oKIVs/tydWlm4OmzOVc1pjvzmOe3RobgroRv5fl2qChx6BQGqLpHa4QNpZ8PAkHVck395TfU62a8O11dOw5HFNrxn+MyIjQoByrBplnQEd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905248; c=relaxed/simple;
	bh=+Q6Q8jost6RR+L6/1WQaoG8urBg7K9/rNabjNfsQh20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIeIoNzVkuOcAmUfrdmCbU3lVIHQahIokaNmuPZ9iXg6hZLxHNC/lqJWWevoltXjWJ/5kiDbqodzFeBtspYxJqm2rvKVmTV6kIvu1W9P9ee0X+PZoE10DBkGtaBadp0JpR0vSScq2rifhredoOXGEMNDOKDKwjLWRx6KmzRhEwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TX7MY8hG; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TX7MY8hG"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f05acc13so65874996d6.2
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742905245; x=1743510045; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q6Q8jost6RR+L6/1WQaoG8urBg7K9/rNabjNfsQh20=;
        b=TX7MY8hGQAJ1sRDepGJX6og7DbvK6Jp16jkP6FShP2PaoJHtfw3ae5mUKgNqkNFHeZ
         7D8p2kulFaaueUB4sgOFNYkiVPBL+P3eiBoMxvL9BBSt9Fl8qpRTK/c7fEPcq/GhemPR
         1MaUyICPEhQeDHi4Fa/L8zGFWTExHW7UaBs0EGqNtPsYxQO5e8uO8GDPA2abV2TB0xQi
         +Vz5sJWHpPaP6fZDmLlyP33E3bxESufETGrdSOCZrrvfoJ+zX/kMvD/Trpdoq0vMjYFD
         CyoQYpJ2F7eF6znGiyEcKuaacIIJ23O8jplnmAgH8uwxCSSiqcWuMug/XoqCvolbGENG
         wlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905245; x=1743510045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Q6Q8jost6RR+L6/1WQaoG8urBg7K9/rNabjNfsQh20=;
        b=tz7rY12S9rCWIsWulwg0AgfrphoHZw2stQ2T7l9QyCg0f9Z064k9gvUOk5iNC+CEL+
         QuRtYlRGx6QQf2K+hPtCad/R1dIi2Jy5VsNL6i5OioQetoTKKblGzwzI4jQd906QXvoE
         RH1le1JBfakYeDaryG2EcUkGl3cdloiAzjxv8Pl1m9+APJv2A0FtiKJc220dODXM6+8Z
         LWqvcSFV70HozGF7kbUrIT/MAqqAUuYffg0mFsVKgqu+Mnm8hLGJFFat/CxjRSS4hnUd
         FSf2cJSmK0Dr0b7OLe1nxNoV47h5KcSw9/SpJxp35B5+Z/JAYAVNn5SYjp0Bb61k68GA
         WAOg==
X-Forwarded-Encrypted: i=1; AJvYcCUNPMPmscMgsWUzrdTQxGoeOAsyPz/E9pjZW4NHOO1+2yKYfh7r2Ec3sMGFOTqUuD0M3y5WeXwtdd0hww==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzFG2l9DvqlMTI5fWKGz68v9z8/ncKvOVRs++u9Hr0bq3dRk6c
	EIY4La/FUwmafd1cnd4tDkfNMVqmUnfbS1RC2Rfw3MPqFXUcYiZmQkk0Jz2BeIVUkjUUBWny5fq
	8mHo8ZfxKifkNlkSNKkIHKUZmQIs=
X-Gm-Gg: ASbGncsmC6LGibiYGF9mKNbvXacHDV5xA7q09FNP1pekwTB28CS3841+V0bbYuXHaEl
	2nxpg2qJgZMjOLKw64fswT2vlUhx+ecQ/B9Ol+63eu9o64XPwuztKTktj+MeK+6Oy0Bk4XXtkeu
	vtw6B6ytMn7eWDNinvJQC+5cNS11foJriTE/1p7GX7lg==
X-Google-Smtp-Source: AGHT+IHzPCRF5SOBl5uX+I45ItuIcu7yYqv1UpwkBeNgwvJPwNXZIu0GAxVrZtFs9aKbKMtvCsG5QpWp0f/ADoOZEd0=
X-Received: by 2002:a05:6214:c64:b0:6e8:f17e:e00d with SMTP id
 6a1803df08f44-6eb3f2b884amr196473756d6.14.1742905245447; Tue, 25 Mar 2025
 05:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de> <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
 <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de> <7afcbbee-6261-4b2f-be14-a3076746d53c@prolan.hu>
 <26e36378-d393-4fe1-938a-be8c3db94ede@web.de>
In-Reply-To: <26e36378-d393-4fe1-938a-be8c3db94ede@web.de>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 25 Mar 2025 23:20:34 +1100
X-Gm-Features: AQ5f1JqJR8vf390EC146ON7d6-teBUeT_TrrTXamjUUZoP5Hfz81vyeOiEOgepg
Message-ID: <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>, 
	dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

I really wanted to keep out of this, but...

On Tue, Mar 25, 2025 at 8:14=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> Implementation details are probably worth for another look.
> >
> > What don't you like in the implementation? Let's discuss that then.
>
> I dare to point concerns out also for the development process.

You're "concerned" about patch granularity, but this is not the sort
of thing that some random person would raise, this is the sort of
thing a maintainer asks for when patches are doing too many things or
are unreviewable. This is neither. It is a very simple cleanup of a
probe function as it says in the patch subject.

Futhermore, this already has an ack from the maintainer of this file.
This indicates that they're happy with it and no significant changes
are required. This is also version 6 of the patch, if the maintainer
was concerned about this, they'd have already provided some clear
guidance on this. If you check previous versions of this patch, no
such requests have been made.

Your only other "concern" had already been addressed as has already
been pointed out to you.

> >> Please distinguish better between information from the =E2=80=9Cchange=
log=E2=80=9D
> >> and items in a message subject.
> >
> > What do you mean? The email body will be the commit message.
> See also:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.14#n623

The email and patch structure are following the format outlined in the
document you link to _exactly_.


Once again your comments are just noise, and your insistence on
repeating them over and over and over and over and over again is
borderline harassment.

You have been told to stop this nonsense many many times, here's a
link to the most recent one:

https://lore.kernel.org/all/92d1a410788c54facedec033474046dda6a1a2cc.camel@=
sipsolutions.net/

Please stop sending these emails and go do something constructive with
your life.

* * * * *

Bence Cs=C3=B3k=C3=A1s, (I hope I've got the order of your names correct)

Please block or ignore Markus, at best he's a nuisance and at worst a troll=
.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
