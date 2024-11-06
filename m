Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C07A2D
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Nov 2024 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730876763; cv=none; b=FOtgC/cIfxtfvD0FWl0uJfHUqwnmK5sCr2p2cAiRiJHWdjI1ue9zd8mjGysx0lNptd4l52bXCtNyM7zZQbelQYLUiX6N1QNplzKr95ISdIpustLMCK9Dmow4nQRURAn/Md20VuHPrz6hnnmv0fwlJHbsHYYy2erysv2AJdK3rag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730876763; c=relaxed/simple;
	bh=p6C5IEPN6P+pbtCgSR46Ccoxyvy0NUXuTKfMt6Fl5DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkvXrqrSI6+JI58wK3nNeclzuJznOdJGFikwPU8maCHHzMXFJo2aD0swmxqNL9q/AvwG6QmumHde2SXZ8K2gRTb+vpsLsISXL3/tnLEmCHxKtJZgH7cXa/Q3hbLAkBh35PVT//8Sx1upb+0col+AKwdEqi2lyU7TVBRzYAAdZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6iqo2Om; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6iqo2Om"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53a007743e7so6946763e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Nov 2024 23:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730876760; x=1731481560; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5sOFKhhbWxoz81S1+CXD6VUF6R09kQsa2DuJ0ohEo0=;
        b=F6iqo2OmcgLW7rpdMcHnOddMeqt3wBBaLSEBrSJ3dmqJCnNt83ZZ4SRT3HZ2OhruE3
         kSYBpTPTYN3H6gCoDxMtbZlsADxk3xbYbmD5ZwMCtSHSId6cuPNMYdgLVjxBrH91JaAD
         ddcflzdRqQ2oqrsAIRDCCI0+A0x3Q1bJcU7+wciKJkjPrkDqQHrXRkWA6ubvWCR31V1N
         +ZlBu7/eB6M0ytruEqWrv4vd17I5nZHmL5naIh9cdyrdV1xAN4x/QcJ7nMBbKilVG5VI
         srF+TcrLEWskxVw01rWEhMVTV35/if2pj4qtiO1I9KO4rXadmd5jfqwciLltoY3fDVoo
         IZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730876760; x=1731481560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5sOFKhhbWxoz81S1+CXD6VUF6R09kQsa2DuJ0ohEo0=;
        b=Lm8oP4slfvqZXBM3pmuQxzXoyA8McDbFMMP7aM2FtbgHoRpPTQXSbgmsZqtWjYtE36
         fOUNRBy2O2JEL6oJAUFBcrCrhPHp9WwmVUbAveq5pHzieioevGQRiTyerIzrapg13x/1
         Y4MxNtNA5QD/92tZt1WAN+xgSMw2Rt2m6RqAskSo/PsSPJymgSGowjopoYZHPSbYFNv2
         S0p6kbWEK77vQ2YiDZFiJv20BG+I7Rtl1ZrTIX2qGzu9+68PA5ey7go/vtGcL92dt+/u
         sOz/rjGc9HH8VA2WLVTs+av7+7asyKRDu4JHNXpw2Pgr8uCynh6vaRy2eVDCl0vqx7y1
         Uo3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiQ6QHLSOm9iMg3LBp5mNhfPVV/Q+kaaO8LL6wOsZoMxqbRhadueijZCb8JTvLLLDAJtsKg3mNs8EKAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBMs1b6gRyT8JWo0Ql5oghXodOUu1at+R8ciQnpwkDe09jllcI
	ke9ZfWeF862e3qkRzh6n0+kLdHBISPfBMy+FXbaYemSiMh5SBxTV
X-Google-Smtp-Source: AGHT+IHch6RbS1NM1k6CBI+Hi17vN7v1edOLx1yQHVelZgvWVj+Tc6VeH8uVB1lg6GXcZxXjYmSOiw==
X-Received: by 2002:a05:6512:ac3:b0:536:56d8:24b4 with SMTP id 2adb3069b0e04-53c79e15746mr10404636e87.5.1730876759339;
        Tue, 05 Nov 2024 23:05:59 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc03asm2372232e87.207.2024.11.05.23.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:05:58 -0800 (PST)
Date: Wed, 6 Nov 2024 10:05:56 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to
 PinePhone
Message-ID: <ZysVVCIdJ_hpe0OS@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com>
 <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
 <ZuazIgLz5PP_Z8Cn@skv.local>
 <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
 <Zyp3N9pGWhLqmtq1@skv.local>
 <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>

Hi,

On 24-11-06 10:31, Chen-Yu Tsai wrote:
> On Wed, Nov 6, 2024 at 3:51 AM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:

> >
> > >
> > > FYI I'm open to either approach. If the firmware can do it, that is also
> > > fine. I don't know if it makes sense to have both disabled by default
> > > though? That would break existing users, but so would the in-kernel
> > > prober approach, which requires both components be marked as
> > > "fail-needs-probe", and also requires that the kernel driver be enabled.
> > > In other words, I think the firmware approach is friendlier for existing
> > > users that have the original batches.
> >
> > Current patches leave original magnetometer enabled as before. So only
> > the new alternative magnetometer is disabled. Firmware prober will set
> > the correct status. So you are right firmware approach is a bit nicer
> > for existing users, nothing will change for them with any combination
> > of kernel and firmware. Let's go with a firmware approach with current
> > patches then, if nobody
> 
> If?
if no one has anything against that.


> I'll wait a day before applying this patch then.
Sure, thanks.

-- 
Best regards,
Andrey Skvortsov
