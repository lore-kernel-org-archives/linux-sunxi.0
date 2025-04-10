Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BD41DFDE
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268892; cv=none; b=QJIPXmTtmym6ccigyHIzd/OZXgxjBuU7YV4BcKNKrauqJhdVQboR2sM57DITfwLL2d2JSNCktE8rKAPqzkoCbj7swTbN7lAr9PTryZU8Xg+16fZGxtAaQxEZ5UzCERvr8yWj4D3lmt9xSrJcTa7ZUrZtsoYqsHQ5he7oEWcrUGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268892; c=relaxed/simple;
	bh=ptTZDuqe+Ue6zawOowkWrw2iEKl9O/8eehXqOQSRR/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sfkkt9FD1S7ovwXrWHKPOY69TeVsdstRTCexsH7puOaMeTMPwham2hxrN7AxEbn7DcECeD2Rmxou7o/SRdFN+Gm8zaxjZKb+Z892gFYD9gGoDV//sKDhcAWeSQJGIxkhM7ZUqD0MT/x7txYfKKj9VqKdhYYXQHl39wQkEABQHkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlHb0/ho; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlHb0/ho"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so3583205e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744268889; x=1744873689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptTZDuqe+Ue6zawOowkWrw2iEKl9O/8eehXqOQSRR/k=;
        b=SlHb0/ho73s9di1HhZE2ZyBlpLHoqYfs4gEAZg82XbDOOLmKaWrIyWJbRfTMHAHGge
         OUYW0Ysb0YV7sFYP9woKno0zIsHnUwslvmXiykgjqWQEzCv2g7qZtI/1rSmx+jNRCNl4
         UMs6o85tSR4DDRfSIe8dgJddvzAuDRHUlZw37xS/nAJwz5+n2Jh7tl2ZyrQwR5TQJoV2
         i2R5jy9j13jHzGPFPLX7I1J1X/z7BjYxBI0+5sW/VDBJZr/79ETr/s8unMJAlgGQv6lx
         ZjZKzYrEJFUrbJS4pPmWQVGhQB5l4llabEURAAaMsFOEplOyD6gb45YLJpMD0TDdEWFS
         VEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268889; x=1744873689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptTZDuqe+Ue6zawOowkWrw2iEKl9O/8eehXqOQSRR/k=;
        b=Sh/MiiBacqgGXck+yGES9xdRY2msazwmlBfCHb3eE/96luLJkCwgiCACgM66szx+ON
         +ZhK3OaCA83KvGChufa+ViY2bF04CNV+ML9ZwFvhz5vderqAl683OMf9fWuIQzpbV3bS
         0mz4btqXnmnWCv8ux6tuNVVQBziIetkpVfAcEfBRvLeurRbV2BK/5M0bq5fUlyz+vYuS
         P0rkrheG4AdKnhWuVfCBx6taeq/GHsC+Uxj5GT/kS2gJHa4tVP8y0GNYKsCLIUomKS9X
         DvDUBULWQFtwJ8zBvAFF6LbEvbqBx1mEahcetLmeFWyTT6NLs3nVMD2S2THaBQ7B8+nX
         C7zA==
X-Forwarded-Encrypted: i=1; AJvYcCWx3hD03t4XlFY1LPWyCyp4KOBSQMq+vSNzxIeLsDEVtVsPWjQqEgoTAEywlqva8TVGivBKIkGAe7dj+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGLaVnh4Oq34l/hfu7K5jiLZ3yUiWIHQmElmdRDCwkVNqkqzaz
	Um6AlOcAKhJUwrtk//T766vdP8Ck6ebkxNW/1eh1Ug5EzGg9/Eo2
X-Gm-Gg: ASbGncv8tA4xerbmxcO4R16UY+Ljg0fyeerPpZnYqRsxTv7u80JmMAMiMHH30E9N/a9
	BOskbrm2Q0NeGBLm1e8zjLzl8CR1noR51uexFS33q0nxwMe5Dq0O4vwcGLVoeouV745LxVN/VWM
	1hQj5Y93Rs9zPDWJapm0nIdYk+zzRIyoDEkZWQmeul1J3j/8qEdnQDZ+x4BoVUnd18v0bTY8G/5
	cVfY1/gWxmrVsqou5W+6Th4Ap8rHr3/CNXcvfgkxkS4723YoQqDHhlBidPeLmE2iZRVzPcD7uLj
	ZzFvQumKcYNDg0jLTGkkrP2t1ebS0CmE+7majCxWSlWm83QdW9UHvgzznguIMIzelCoKDBf2qd9
	1YBcV1LIWadgRFr5h
X-Google-Smtp-Source: AGHT+IF69rFKiLAue57LGW6Wvgn5FhfEnmst8cQIjw2EQ/sFrv9dpfPc7N8s1M8wiVU2AsItROJUcg==
X-Received: by 2002:a05:6000:40c7:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-39d8f4fabcamr1109573f8f.55.1744268889013;
        Thu, 10 Apr 2025 00:08:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893773b6sm3846928f8f.27.2025.04.10.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:08:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Iain Paton <ipaton0@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Paul Kocialkowski <contact@paulk.fr>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Ian Campbell <ijc@hellion.org.uk>,
 Adam Sampson <ats@offog.org>, Zoltan Herpai <wigyori@uid0.hu>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 VishnuPatekar <vishnupatekar0510@gmail.com>,
 Rask Ingemann Lambertsen <rask@formelder.dk>,
 Aleksei Mamlin <mamlinav@gmail.com>, Peter Korsgaard <peter@korsgaard.com>,
 Michal Suchanek <hramrach@gmail.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 Stefan Roese <sr@denx.de>, Phil Han <pengphei@sina.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Jonas Smedegaard <dr@jones.dk>, Jaehoon Chung <jh80.chung@samsung.com>,
 Heiko Schocher <hs@denx.de>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 2/8] sunxi: Enable PMIC drivevbus regulator support for USB
 supplies
Date: Thu, 10 Apr 2025 09:08:06 +0200
Message-ID: <2217953.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250409002036.12212-3-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:30 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> From: Samuel Holland <samuel@sholland.org>
>=20
> On many boards, the USB ports are powered by the PMIC's "drivevbus"
> regulator. In preparation for switching the USB PHY driver to use the
> regulator uclass instead of a virtual GPIO pin, ensure these boards
> have AXP PMIC regulator support enabled.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


