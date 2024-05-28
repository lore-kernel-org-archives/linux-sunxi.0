Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBD17083D
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716911808; cv=none; b=EpWFSQYRAGkUGvFyBICurIaDIYJiiKTZEqQP/0G0EEC4ORbz/jcG4MJC8MrDc0YBN+T0VY86qJ7REEsVmzIEXK73NZtwtl9yJ99Hy1lexp02TpTMz900HMJSwxtNXvnc5VAsuNFEn/xDBz1NCuvM/Z0kvBiVpjkE/eJdlA5FOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716911808; c=relaxed/simple;
	bh=ysSgJke61ofzGTOSWNXuddZUCwyuvR4kJz+M8yt9lHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYp/V0d/Sb3pgv07Y7laBFLvRlA13XhJY+AyRkHR4WRLCPyCn2L9y7RkAYi/RNlR3wETY7f6Euypf0iC/lcD5qLmBEqBzTaLXQlIZiqs8Fex0ZaGUuisRnw9mQSkKBYP+5yXqaFYHEralQGmlTczCiJv4tKtQfrR8SrHpBqHHps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-523b20e2615so1180454e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 08:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716911804; x=1717516604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvZxaJF28iL5uKpQcCM7Mk+grk1BxPMDMrXsVUajEUM=;
        b=c3Cvhd5hBm9a7iAd8/DgpVLI2qC+FJOwECXjBl0HPOBXb7MD5ejVIkCOM6THVdYNth
         sb2D1+eqMB0jXEfPbwKa77XLGCZjU7y/vo5ubmRf/OfPP1jUpe77Dn9GiCddaxwXbdfn
         wJzT2gXV/JOkT8XEVKlU94YUoJDQYgkEE8eVUONH0O3o4d+qQAQ0X75+RLvjA0EltngQ
         GHfu0niJ+GhF7MMF1NoHs/4NQGJQB9ruomQl2+zHiU3rwlg2f/TCFra5CpmDsp6leHcr
         BG8wV19t/LSWhcT5I/Eoqx4B6nv0xkWBB5QsnvWybur2t66zU+NKWiyiU3fTDZEjwoXM
         pIwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0f6mlhEDRh0tzCeEkX6KbzQwQjMJLmswHn5SaS5bJnYrM4pKZb/X5/yyQNf+kJX+X8Ahc3+6n77oigUt5yJ78Qjme/RSblW3H0wk=
X-Gm-Message-State: AOJu0YyK3pWjU8/YsP6nhmSeEDUFIpKMIHYZSu/B1qTh2DbymH/fCR3j
	NjDmUTWZzd+QBaH1pFozZ1Scj15TxdPZB4dOV/2flat8bEhX7vbPuC21vsF0
X-Google-Smtp-Source: AGHT+IHNk+TRtCNkRK4ENVxyCVJ0rZdd/aViMcVJL7kk9l2oWft74CN8wX4pKFjzhK4I38lqci1A3A==
X-Received: by 2002:a05:6512:68b:b0:520:7a44:3f30 with SMTP id 2adb3069b0e04-529645e342amr8903745e87.16.1716911804452;
        Tue, 28 May 2024 08:56:44 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529715e712asm997163e87.295.2024.05.28.08.56.43
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 08:56:44 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so12716081fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 08:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWCbKz6Onuz1aWvMi42DIDktpt8lq/35z7yHeGApP8FOCgM6Ckvv9d4Kk0h4UO62GUdhIEnP/JX4DAEwOlaU4D+vTk9mMOmFZ4IP8=
X-Received: by 2002:a2e:90d9:0:b0:2df:c2b:8c84 with SMTP id
 38308e7fff4ca-2e95b09452fmr76184881fa.1.1716911803445; Tue, 28 May 2024
 08:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a772756c2c677dbdaaab4a2c71a358d8e4b27e9.1714304058.git.dsimic@manjaro.org>
 <49abb93000078c692c48c0a65ff677893909361a.1714304071.git.dsimic@manjaro.org> <171691117471.681554.6744393893618279840.b4-ty@csie.org>
In-Reply-To: <171691117471.681554.6744393893618279840.b4-ty@csie.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 May 2024 23:56:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ETOtHxQf1D9n+c9bGivsRTC=O8swDru+2cX2UT=o0qw@mail.gmail.com>
Message-ID: <CAGb2v64ETOtHxQf1D9n+c9bGivsRTC=O8swDru+2cX2UT=o0qw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Add cache information to the SoC
 dtsi for H6
To: Dragan Simic <dsimic@manjaro.org>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 11:46=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Sun, 28 Apr 2024 13:40:36 +0200, Dragan Simic wrote:
> > Add missing cache information to the Allwinner H6 SoC dtsi, to allow
> > the userspace, which includes lscpu(1) that uses the virtual files prov=
ided
> > by the kernel under the /sys/devices/system/cpu directory, to display t=
he
> > proper H6 cache information.
> >
> > Adding the cache information to the H6 SoC dtsi also makes the followin=
g
> > warning message in the kernel log go away:
> >
> > [...]
>
> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
>
> [1/1] arm64: dts: allwinner: Add cache information to the SoC dtsi for H6
>       https://git.kernel.org/sunxi/linux/c/c8240e4b0fd2

OK, that's weird. Somehow b4 thought this patch was v2 of the A64 patch [1]=
.
Looks like they are threaded together because this patch has "In-Reply-To".

Please avoid it in the future.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-sunxi/6a772756c2c677dbdaaab4a2c71a358d8e4=
b27e9.1714304058.git.dsimic@manjaro.org/
