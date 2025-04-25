Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FF5268FEB
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594880; cv=none; b=W0ZUT9siT3tz4X50W6auy6ivqREQnCHRUnWDOLiKxtsV0V9FpYGsuogNacpQUvTUBxfBnhEKbOVMffY815YQ7Q7Y8njwnLvNd4tP0yAwgHqo25U/b7vf7S23K2BGK0kLdQlSEF3VPjINELikjsKSdO1xFGam7euMWXL/mC2vyQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594880; c=relaxed/simple;
	bh=Mrk3RA2eQQoTudoCKFs8L5iamijk95XDayQrPOOfxBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oF5+GojutdJkphd6fF0dpVjp0sg+Yhdqc1ehLRwssGDrNgEbBOseXTjUCmZ3ScbznqCfNd/cahDhbdNUs5NfbwulrvDDGGb0KflbRC+k594DIbpvNjrR54ZxNAamog5zk8nUCkdp4nGCHfnMBPxb7B1aEMA/pzjAaxxi1wb0wKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso20430871fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 08:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594873; x=1746199673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=feUYG+ADKxy5u46DUzbwJ3yPnREVGzj+yGdWXxrHRlo=;
        b=umxvBM40Z+o5qSJTtRiQjH+KPH9vkDsdxX7aI6gn8gkJ/ygMLLd/S7hkbxMp/W2YTN
         oaqa6uoeeEYFvxaLXE/oSHcjSNd8EVRaSNjMdk0A/lvbv7WKDmDYTcjg9vos/RgtUVf4
         myQtLGhHB0FFS9zVcDj9/32lE0lCY6sRcWU0vArofFx4+sG3WFmcB7BbE0jy2A0QADMk
         ovdjrwY3qK8boBpCjUtnfXKpvqgr9ZKzoZrMna1pHeQT2lZ2gYlZR+kqo2kCY7RtjXPL
         h3RDe62JiPjNg0ga4kiwepba7b0+GyrbnbbT80+AeMdAQ+fzg/GdLMn6oJBz8DUFbeEp
         1qDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr8xKEFovsI68r4v+3cP72Mp5frMv+7xlrWCVDkdUnnTqgzqUoXrR3Gd3Vmk5tv5a/5PLtOL0GEWzUmg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt/+P2To5F/WFA3mezNr294BGSVrIPc8sczhxlAeetfAXsnavS
	Xt0ehJf4iOzNFlmmgAEw7SOotzOT5wvUdL9FBm08ToHIDrgClWF2qonbSlGBTms=
X-Gm-Gg: ASbGnctZheH0QCDa6qXJhgRgjspK+r9l/YSNsUnBbb+oi+zOWJJMm26IJVH3phuIHQX
	dOj319O3mqL24YQRJaQ5pe7XuhR+2npeLSwLTCHQ9ncKbF0WXazRk5KGI4Teng51U2UKwIXgOxO
	qOT/Gw7QnrIHJY8JIDUXisX68zssdwmus3kTXGqv0gnJPvVIzudw2tSofiNkKwX3zDeJl8/ptHC
	uPGgWt4V3SKAEQ7mlMH512xs47oYomlZ+um690cwDEc+HRtDgFWYgMP/rO5tjgHgXfJQtWv0F5+
	f/O+hx/k5lg1s48qzidkEpMdRH8U/Odnb5oD4THQp0/OqYosn4BklGlPytp/yqLq2ppjlQkexg=
	=
X-Google-Smtp-Source: AGHT+IFMKT9qi890WRn1csvWG8Bw/0xpSxHB1FLFlOxqWhozN4QsK4X70LH16s+F9ryh/8wvOHjMLA==
X-Received: by 2002:a2e:9a0e:0:b0:30b:f0fd:fd19 with SMTP id 38308e7fff4ca-31906451f97mr9684321fa.16.1745594873306;
        Fri, 25 Apr 2025 08:27:53 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96e91sm7479791fa.96.2025.04.25.08.27.52
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 08:27:52 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3104ddb8051so27286641fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 08:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXE/fLM6gsAxdMshvxmedbocWO791SrRalBJENoK0Y2EHkzchhW74pzQUCsZfthAZXiXTR81altpK2EtQ==@lists.linux.dev
X-Received: by 2002:a05:651c:154c:b0:30b:efa5:69a8 with SMTP id
 38308e7fff4ca-319080e4888mr10622571fa.36.1745594872478; Fri, 25 Apr 2025
 08:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425023527-GYA50272@gentoo> <20250425030006.45169-1-amadeus@jmu.edu.cn>
 <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com> <20250425044747-GYA50408@gentoo>
In-Reply-To: <20250425044747-GYA50408@gentoo>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 23:27:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v650hzgWGC6H4gL-YkaWCw7RJjBYkdcXGwXaRCa7T6G71Q@mail.gmail.com>
X-Gm-Features: ATxdqUHtlXlW5ElJgIFQbcm5VC72kEfcPm_-jaGId3qhnAcscv0DyPelGJ1i-0I
Message-ID: <CAGb2v650hzgWGC6H4gL-YkaWCw7RJjBYkdcXGwXaRCa7T6G71Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
To: Yixun Lan <dlan@gentoo.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:47=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Chukun, Chen-Yu,
>
> On 11:52 Fri 25 Apr     , Chen-Yu Tsai wrote:
> > On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn=
> wrote:
> > >
> > > Hi,
> > >
> > > > It seems I'm a little bit late for this, but while we are here,
> > > > Can we also append 'cubie' to dts file name?
> > > > e.g. - sun55i-a527-radxa-cubie-a5e.dts
> > >
> > > Usually we use the device name (without the vendor name),
> > > maybe sun55i-a527-cubie-a5e.dts would be better?
> >
> > I agree with this one.
> >
> I personally would prefer to keep vendor name, it's more explicit
> and easy for poeple to distinguish/find the board dts

We really only have the board name, which sometimes combines a brand
name, but not the vendor name.

Same goes for all of Radxa's other Rockchip boards. The file names
are all rk3xxx-rock?????.dts. And all the LibreELEC boards are
????-nanopi-???.dts.

ChenYu

> but, this isn't something I really care, so I won't insist on this,
> please proceed either way, thanks
>
> > I can probably squash in a name change (since I'll be squashing in the
> > SD card slot fix anyway). Andre?
> >
> I think it is better
>
> >
> > In that case would you prefer to keep your current patch separate, or
> > squashed in so that everything is clean from the first commit?
> >
> > It's up to you since you lose out on commit stats.
> >
> >
> > Thanks
> > ChenYu
> >
> > > Thanks,
> > > Chukun
> > >
> > > --
> > > 2.25.1
> > >
> > >
>
> --
> Yixun Lan (dlan)
>
