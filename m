Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849F18BC3B
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Nov 2024 02:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730860318; cv=none; b=m2vWhVyTetkzZVaJgOFaFFt6ChWJmMxlrix1r56atOCrUj1iDWcOWntVjoEQ+BrNX7pEgjvbURUaUolEwYjVzabpLtlJlqk4SqI5dRDalPSqfYvQ9JlK/FnYy0/QS1Hen8xmQQVax9GyhW+j7PV6Q8WYjdSJw0GKBzxu/oYO5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730860318; c=relaxed/simple;
	bh=tVfMiN/1G4bL7S20Au2tc2qwX+CMUgs+LUTAdwJcbZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=m4dznQNJzzMmNGSSln73/R+p4JCdPIJDgxcLWgdkSQo+AaXaTWWCquj4YDbLghNwWB3tYLyvjMZFQypYRH0BdGeT2Ud43MbGzWG0kJcj56BGHeStxSSjrNZXfP7mtRn9aNN40TsyAk8RbIe5XcljxtG2C4Sx8odSVuPhrehBOZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f72c913aso9906118e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Nov 2024 18:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730860311; x=1731465111;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVfMiN/1G4bL7S20Au2tc2qwX+CMUgs+LUTAdwJcbZw=;
        b=UGxkxCAAHfmq8IvV5j0VCq5gSp4v3XFfrztJBotC4EqFvg1xpYOmX6m790Gkabw4dI
         SIQCvAHfnvqZyaCnOrtbij+/eaUOdT22Z0aEwaIJs1WXrJBgA5S0hfHoNqnIel32VTZH
         EAeVg1gSHMn6DbqNLJM4PQ1rrqIB1N8RIJ8r6d8WdMXlyLYCN85FsDHEWy/pt4ryoJKe
         dzmiNIMJH/qfEUDKGSMvz5cBfelquK+PW7ZJSAsJGJskfNApA+WIxAFPiwRoqK+1E90O
         M82hMwXQsp7psbex0Xh0A884Z5oDwwbe/+Gf2Fh2jDM/cMMIoeo0XaZUJtibTc8guelM
         81KA==
X-Forwarded-Encrypted: i=1; AJvYcCV3xDHAoJLV0w+5sLUTwkxsrtb90ptw8A8XjvnLboRiPdohOAC9ojtqdthfwWNmEW1m0etrq7mIRW8MuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL3s0wPHvd35FqWIbAoxETTJaVNzvc9oBz0NwSBQ/ilJROOw/n
	tOPbWF0TsTzOzyEYnqws5RXVDx0paIcCzzACanyYfbJtAms4b/RbjyK/7oWv
X-Google-Smtp-Source: AGHT+IF65zF2HDHqQEG2yV8Szwd+R3wmSyD2XONOw2ki2jw4yBFT3ji+0kykaHtoKqXXWfTdJfp8yA==
X-Received: by 2002:a05:6512:a92:b0:539:fd10:f07b with SMTP id 2adb3069b0e04-53b34b39774mr21189248e87.55.1730860311270;
        Tue, 05 Nov 2024 18:31:51 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9617bsm2303882e87.20.2024.11.05.18.31.49
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 18:31:50 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so52695111fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Nov 2024 18:31:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBf42xtvxAK2Rn8vtsK+PJyERz3X8tpijQf3C//RzPnbVjKZV6jPsW1ataoI+jWBu+xYVHmRNlebSANA==@lists.linux.dev
X-Received: by 2002:a2e:be21:0:b0:2f4:3de7:ac4c with SMTP id
 38308e7fff4ca-2fcbdf68626mr221087231fa.8.1730860309696; Tue, 05 Nov 2024
 18:31:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com> <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
 <ZuazIgLz5PP_Z8Cn@skv.local> <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
 <Zyp3N9pGWhLqmtq1@skv.local>
In-Reply-To: <Zyp3N9pGWhLqmtq1@skv.local>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 Nov 2024 10:31:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>
Message-ID: <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>, 
	Icenowy Zheng <icenowy@aosc.io>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 3:51=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> Hi Chen-Yu Tsai,
>
> On 24-10-19 10:04, Chen-Yu Tsai wrote:
> > On Sun, Sep 15, 2024 at 6:12=E2=80=AFPM Andrey Skvortsov
> > <andrej.skvortzov@gmail.com> wrote:
> > >
> > > Hi Chen-Yu Tsai,
> > >
> > > On 24-09-09 16:08, Chen-Yu Tsai wrote:
> > > > On Mon, Sep 9, 2024 at 5:48=E2=80=AFAM Andrey Skvortsov
> > > > <andrej.skvortzov@gmail.com> wrote:
> > > > >
> > > > > From: Icenowy Zheng <icenowy@aosc.io>
> > > > >
> > > > > New batches of PinePhones switched the magnetometer to AF8133J fr=
om
> > > > > LIS3MDL because lack of ST components.
> > > > >
> > > > > Both chips use the same PB1 pin, but in different modes.
> > > > > LIS3MDL uses it as an gpio input to handle interrupt.
> > > > > AF8133J uses it as an gpio output as a reset signal.
> > > > >
> > > > > It wasn't possible at runtime to enable both device tree nodes an=
d
> > > > > detect supported sensor at probe time, because both drivers try t=
o
> > > > > acquire the same gpio in different modes.
> > > > >
> > > > > Device tree fixup will be done in firmware without introducing ne=
w board
> > > > > revision and new dts.
> > > >
> > > > FYI I've been working on an in-kernel prober [1] for such alternati=
ve
> > > > components. This does not require firmware support.
> > > >
> > > > [1] https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chro=
mium.org/
> > >
> > > Thank you for the information.
> > >
> > > I've tried to use in-kernel prober from your v7 patchset [1] on top o=
f
> > > -next and it worked without any changes to firmware.
> > >
> > > Since there is still on-going review of your patches it looks like
> > > it's to early to submit my changes for review. But I'm ready to test
> > > your new patches.
> >
> > FYI I'm open to either approach. If the firmware can do it, that is als=
o
> > fine. I don't know if it makes sense to have both disabled by default
> > though? That would break existing users, but so would the in-kernel
> > prober approach, which requires both components be marked as
> > "fail-needs-probe", and also requires that the kernel driver be enabled=
.
> > In other words, I think the firmware approach is friendlier for existin=
g
> > users that have the original batches.
>
> Current patches leave original magnetometer enabled as before. So only
> the new alternative magnetometer is disabled. Firmware prober will set
> the correct status. So you are right firmware approach is a bit nicer
> for existing users, nothing will change for them with any combination
> of kernel and firmware. Let's go with a firmware approach with current
> patches then, if nobody

If?

I'll wait a day before applying this patch then.

ChenYu

> But I like your in-kernel approach as well.
> JFYI I've applied your v10 patches [1] on top of next-20241105 and retest=
ed
> it with patches for magnetometer. It's available here [2].
>
> 1. https://lore.kernel.org/lkml/20241030072229.1013235-1-wenst@chromium.o=
rg/#t
> 2. https://github.com/AndreySV/linux-stable/commits/in-kernel-hwprober-ma=
gnetometer/
>
> --
> Best regards,
> Andrey Skvortsov
