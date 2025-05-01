Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508BA191F6A
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108400; cv=none; b=jjr9L3a9Z/u2k9Gg+u45MU2I7IYVrTd/FE16S5gby3ItfxxL++WGNTQiO72gCto2rYGXNWlPORI3dLd94je/VcGv2FpfV7p+4cjiAetMMPtqaDBJickxt35CWYn4b+UWASiUnIoFbBt+v5apDWjIq7hDzwBexfEutqkDhYHhoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108400; c=relaxed/simple;
	bh=eq7ZlVtOhJAKF8KlViULStajAEHwNZ3/EnWmZUjvyAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urXRwq9+h5HLUVnKiPhi3Z0O2IytK0E+X39zpZqfRsRfgK7B7hsYw6AyxQG+49nbE1e2XqcHJ5unkn9DRwMgH9mPrPGvKcjIkl1alpe74xxsAekK6DFPzRc63wfL6FRELStzabV32U7fppr/qIZVjrj6H4ruZXJ5mosufclJcWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so22715761fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 07:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108396; x=1746713196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsTdpsVjMRw0CjNDfvFcezHetFdyyDNcPE3HNVY7XEM=;
        b=buatrtfMf645Sqdjlb1lSrGQJqgnvX7NyQZaKpYAo8fIT2k7EOYtolD5csgxDUW7cc
         tdUfHcJgih3GetUVdBHQ68GWrWjvA5RU5gUnBmPzw7SsmYyEByBM/CX1MiBoow75joSB
         ri4lLZ9q2Eavzsa9RiYvMLdAbV757LFcQlJMrK3EN5T6u2UK9iJHmS2/ywx4Aqq5iRlG
         uFe91I4Dvr7NvU+IlCfXBalhNt7uRmWpFkUB7lyL5LK+N4CZMgTqiYNb25NLw4aVZynJ
         1Yojcja7rwz6HvQej23dhJ1pAq2Fcrvp9UBy9ASJFAJilhJ9D8Yz/pkgnyRmLh2JASfS
         FPUQ==
X-Gm-Message-State: AOJu0Yz4glMSMlVNpik0jD9T2dkrVKj8XRnoJq77eY5YCoiCSH/rEdTi
	lj4Ppzk1ErFbZhYZNoKDp8X4MOZNrBFugvtvc8gZ0kGfjd95drOGfBPkpjym
X-Gm-Gg: ASbGncuxikP5gdmP02ELXhAOGwdbSpFwnahqjKldZDM39O3OukxmPNHwgT4BR3VYcDO
	8WWSodleXuP5ShC+oLDc1qVPcfPO8g0KlXsjf+oSqwsqcTVX2RVWqV1A2uTMwiTIMmujGi0onJf
	l5UQwV1Qo9Qb9ud/x9dxkHvEetXk+bWxSs3N9rPU92S1R3FF3UY2a0GTpecvC4KYFN6c0wwzUbe
	5K9uXOJ++DbcKPnLFfAop4GV7chGWSUx6sY2y0KFM42PboCr7BnoYHomaQsTa9ZiqRjuYYJGg3S
	bAqgQAqveXRrtoeUXVwfqaqTeLll3m8N0coeGLjoWnh3w/Q+q7QIDwMN8JYY67immw2bvDs2MT6
	bprDS
X-Google-Smtp-Source: AGHT+IHa8HDme97RTcaQGltb62bKqONzj8TNdqkKS5Ijn48R5iHOIgYKHXKqrKkUjuCfwSfYoShT4g==
X-Received: by 2002:a05:651c:1441:b0:30d:c4c3:eafa with SMTP id 38308e7fff4ca-31fc090c038mr8576181fa.7.1746108395085;
        Thu, 01 May 2025 07:06:35 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b394e6sm1082621fa.20.2025.05.01.07.06.34
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:06:34 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54ac9d57173so1846249e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 07:06:34 -0700 (PDT)
X-Received: by 2002:a05:651c:1584:b0:30b:c328:3cdc with SMTP id
 38308e7fff4ca-31fc041e8a5mr9237841fa.2.1746108394732; Thu, 01 May 2025
 07:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
 <174610166405.2974716.1586244113913047340.b4-ty@csie.org> <20250501132211.0310ae49@donnerap.manchester.arm.com>
In-Reply-To: <20250501132211.0310ae49@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 22:06:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com>
X-Gm-Features: ATxdqUGc29VBDSkZt0moBX3INwcxqYrt2rDTSi0y2jGwXrFLxq5q8fOxW7jn2YI
Message-ID: <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com>
Subject: b4 thank-you letter shows incorrect repo URL
To: Andre Przywara <andre.przywara@arm.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, users <users@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(dropped most people and lists from CC; added Konstantin and kernel.org use=
rs)

On Thu, May 1, 2025 at 8:22=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Thu, 1 May 2025 20:14:24 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> > On Wed, 30 Apr 2025 10:53:25 +0100, Andre Przywara wrote:
> > > When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the =
order
> > > of the last two arguments was different between the users and the
> > > definition: features became flags and flags became features.
> > >
> > > This just didn't end up in a desaster yet because most users ended up
> > > passing 0 for both arguments, and other clocks (for the new A523 SoC)=
 are
> > > not yet used.
> > >
> > > [...]
> >
> > Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi=
.git, thanks!
>
> thanks for that, but the URL here is not correct, is it? Should be the
> kernel.org repo instead? Saw this already in other "applied" emails.

That's weird. It is correctly pushed to the kernel.org repo [1].
Maybe it's because the git-config remote entry for korg repo's  is called
"sunxi-korg", and the linux-sunxi one on GitHub is called "sunxi", and
somehow b4 is getting confused?

Konstantin, have you heard of such reports? FYI my b4 is version 0.14.2.


Thanks
ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/log/?h=
=3Dsunxi/clk-fixes-for-6.15

> Cheers,
> Andre
>
>
> >
> > [1/1] clk: sunxi-ng: fix order of arguments in clock macro
> >       commit: 4a9c3c3215491f25bc66d615faa921c814b1a479
> >
> > Best regards,
>
