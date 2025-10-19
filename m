Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7C22D7B5
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 07:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760859703; cv=none; b=SevTnfueZG8cyFdVBEyPh+VxEGoZ3zaWVB8AhVyf9XZLmYAwijRspxP3lpRTVB/MtuMxabs4gBPj7MLOM9Xo4S8LXDAslVtvGiSfztXZnTB43qsErhihMlTfVZ79gfzu6Tp6Hiq19+cysBnxbQ7UJ5JKlv2VKU+sJcr3MDdkgm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760859703; c=relaxed/simple;
	bh=hjuUe+UFCTyI3ZlwUaVCKaC02uBTC5d7Of/hpQUOtLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWxRc+tmy0s0LDfKa7sXd67eC94/fgZH4eFa3uUrlqkWxREYZ1UPoSn7Q2LDj7QOk2NM2oyyA92iPMwWutylffrhqVEjDo9dzEB5RUVGUnc9VXuaDM57f1m7Cs3QYVbagSCx3h4+C+yGxtCptchnENLxX7hkmvqXe05agrGEOZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57e03279bfeso3800639e87.0
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 00:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760859697; x=1761464497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjuUe+UFCTyI3ZlwUaVCKaC02uBTC5d7Of/hpQUOtLw=;
        b=ZM1PY3YX17eCwZT6SK0vzQCQ8Z5SdlUG4SCyvKgnYukHgYnBDtag1ln8i+O6ig/32W
         32SXKkuimvIY6LJ+3UQC9qXAg3uCoWC2ZWIGtTZ4I4mojOfx3Lw5VSc38S2FuBJo1xd+
         kHIxYUljzEZy3gt9fanqe4o553dQctTdk3GtxNDKJAO+eRXbal35Dp+lZmroz4TZghbO
         znXq7AwXx2nJCUqju7o/SMiK/oIPN6o4tN0Pw9/xWWyNTncfgQTrR09zdwH8i3mOfTv4
         T+opPyoBB47V6UgZKJ8BZCoMHCmwqv2sYwdhs2CMXDrkbhescW0YJZNIwseVYrlshEXo
         YFMg==
X-Forwarded-Encrypted: i=1; AJvYcCXv0ccn2fnysO1FpBv455RXM312Q3tNCwY091lbpgxU8y21jaxMfBMeBMBrjavXwUQJQhl5k9XfKIY1tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeSNFV8WrQ4KuhgxqucPx8zDxPlhZJVt1B+dYZHIBY8GXSzv0z
	bES07hRLJfph/tJH0vE0hRnq6NbMx7ISrQbbYJDTMt/GG8i7y4Ba7TQRw8Jrnxgc
X-Gm-Gg: ASbGnct1+/35rO3ucGTGb67Oha4VcKNG0S1LHEZAjjubHFxyyPhf13R/pmL0CCEqxj/
	Cq4e2ngwjh3J+eei4NXOyTtD5p3B2Hw5b4Z16q7W/o472pNVylOGyuyLZjiEggC32EvKrbyK+lx
	Fpx5vyvgTQrZRgdWYt14Pdqf7cmu8HxyIe2T52n8qxslgxRnBdSECZLXIoNVoijnH2DQW/SyNk8
	QpqVITacCzppy001FIM6GHRUvJZJgHuzfhkcEKc6yQLW85iNYTVVZXv59XGMms3gMdn+IaVKmbU
	GODosccUSjf8d+Vih3H+3UFSZe7UssT9mZkdjM2X13pgnPjLoO1PdUkdB6Wn+5hOzrtF4RQ1BsY
	KD53VI05O04sFJVQnQuZD12PBwgQno5xPzSOIrOM9KCxtc09pUC9jEEPdeqtMj5lrQmzIeFlUi9
	+eUKQhVEjvLvjkYnkVQE/CF45jDO8dUBkW
X-Google-Smtp-Source: AGHT+IGPu4/sFuzA5O+DrtrtCJqm0p6uJ4rBGa2apI9pQlF/y40CBV7Zk2yMMhtyhw55t2CxdJESWA==
X-Received: by 2002:a05:6512:23a4:b0:57b:f66e:20ba with SMTP id 2adb3069b0e04-591d8384329mr3003691e87.6.1760859696778;
        Sun, 19 Oct 2025 00:41:36 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def2896fsm1352138e87.110.2025.10.19.00.41.35
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 00:41:35 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-371e4858f74so40081291fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 00:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoRHTG+uAe5D5PZdAeSBGk/Xaq7i38VnMSfsAszsKChJ2jC0Q6FjPTzP4ZjrN3gjeOmT86B6I1LCM1TA==@lists.linux.dev
X-Received: by 2002:a05:651c:2113:b0:36b:2fab:fa6f with SMTP id
 38308e7fff4ca-37782137beemr41886461fa.3.1760859695663; Sun, 19 Oct 2025
 00:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-2-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-2-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:41:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ddMgVSFFtQde34BY2FcjPn38hxCsvVQ+m5+fOJtyJ7A@mail.gmail.com>
X-Gm-Features: AS18NWCXbetOzzBsxzmfJfwCXigzPHLCDC4AqSPGnEbYZf4O62hkT_fB8IZOMeY
Message-ID: <CAGb2v66ddMgVSFFtQde34BY2FcjPn38hxCsvVQ+m5+fOJtyJ7A@mail.gmail.com>
Subject: Re: [PATCH 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Properly define macros. Till now raw numbers and inappropriate macro was
> used.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
