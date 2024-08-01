Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F91A71E1
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Aug 2024 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525774; cv=none; b=KisIz4XZVfg3LcY+RKiHHO/qzyhqaGnWZR8bHeBWAUOfDoZP+Fk6UItEe2hX5czErc3YVUrcVThUeGUUlDpJpWv+1tZxNqQy5ykGC3Nfq3OXRjLEvXTjjMRyvQ8I/wUQo1JUJ440k/syCGC/eAUPEMZfoa9pVNALGCouOq+zwGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525774; c=relaxed/simple;
	bh=VEcaGB9JhrX6r2iLab6nrkJZCg4diAR5tkxJzfjgTjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTmkTyuLAahKaHNSjnxt0SoRe1NzfTbRxBauAISoup8uSgL8Vscn+tCpB4D+/dRD8Bw7omDkaon2aJ9rMcMOcH59iZUwBsjn7h7ih2MBw7VUsU5fuhUO+MqLvNF1mXQdbvVW17DPGMpyGpvvSutf5c3kq4RUI4Ju0oEnhi7txz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f01613acbso2550589e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Aug 2024 08:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525769; x=1723130569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Utqgbq+ns727DDPMponi3tkeUNp+6Bq/5OauBcszmLI=;
        b=vp0rG05qKNkHkv4Pcr6CrgiBXbe6RwepRQIq6iL232N8t0JK0kloV8p1hEGFFKPA6s
         rvc3J4Wyq7C+N1msZ8xgerjisM82xz83JNnemNITu8uwOBhKKDEOaWHqdL0Am9kVh2pG
         S3O8zcLqIrKqf6e29vXx520Hpp181RjtU9OZzBOYkRzip1PcRdqps+eXzcrnW3Rz3NCn
         TN51FhRAlxYz9vOoDZPxLZTiY/UIkbJ7H7vGs6GlNH9jdAVh73JID1qVJfUcxQuoNmr7
         BXgIsVPeLaLaqW9UkorQPjaQSsiF9xxeCoVx/53CJY77JbvpPWpZdDY/PMRA+SoF8/aG
         6n3w==
X-Forwarded-Encrypted: i=1; AJvYcCXD2bYWPhZgylCLpBbPg9nBOUNDHoeeSjcv2a4SactKJoJC7r2BQj09ZGnKC8upvG8PRqdXmLHJm9VcVtkpGGZ1V16greBdGRcJIOM=
X-Gm-Message-State: AOJu0YyPFnsa9iqKWHG8Ig7yJNUDLpvevHnZzNRQMbQzipTgYQQFWH5q
	cq6Sk32MNSTsMLr5OfRJR1oT0oBvVok9Xjwc/XvXSVTz/HCmvXxIcHbykVzL
X-Google-Smtp-Source: AGHT+IGuLT6/n6i2jFZ8a0LSRqud4bv41bk+yerbGvNXThVb1TE4amXpXfcQndxO9JdiQR5W/FPF4w==
X-Received: by 2002:a05:6512:3407:b0:52e:fd50:fe5a with SMTP id 2adb3069b0e04-530b8d2db53mr633936e87.24.1722525768814;
        Thu, 01 Aug 2024 08:22:48 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc3eb9sm2640875e87.43.2024.08.01.08.22.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:22:48 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f03df8c8cdso23924101fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Aug 2024 08:22:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEtiksrxUifC3QE1OgI1pFWBO0Hlp4TxjyLSBU31p0Mll+ZyZYQWGVoetd/cP2+kYfh3bBsQwbISkR5wiZY9OlrVz99G8rO31BvyE=
X-Received: by 2002:a2e:be07:0:b0:2ee:df8f:652d with SMTP id
 38308e7fff4ca-2f1576089fdmr8111941fa.2.1722525768415; Thu, 01 Aug 2024
 08:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418000736.24338-1-andre.przywara@arm.com>
In-Reply-To: <20240418000736.24338-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 Aug 2024 23:22:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v64DLez_FwH=Na=swQ30BdZa8JPaueFkM=ozjU56=f1DXQ@mail.gmail.com>
Message-ID: <CAGb2v64DLez_FwH=Na=swQ30BdZa8JPaueFkM=ozjU56=f1DXQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] regulator: Fix AXP717 PMIC support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Walklin <ryan@testtoast.com>, Chris Morgan <macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 18, 2024 at 8:07=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> This is v2 of the fixes to the AXP717 PMIC support series. Lee put the
> original patches in an immutable branch already, so these here go on top.
> Patch 1 is new in v2, and adds the IRQ status and acknowledge registers
> to the writable range. Thanks to Chris for pointing this out.
> Patch 2 contains fixes to the regulator descriptions: the LDOs had the
> wrong supply source, and two numbers were wrong. The datasheet describes
> the voltage ranges and register values differently from what our macros
> expect, in a way that literally begs for off-by-ones, so here you go.
> Also there is an actual wrong number in the datasheet, add a comment to
> document this.
> I don't know if that's still feasible, but those two patches would be a
> good candidate to squash into the patches that they fix.
>
> The other three patches add the "boost" regulator, which is meant to
> provide the 5V USB VBUS power when operating from the battery. It's the
> usual trinity of binding/mfd/regulator patches.
> Again this could be squashed into the respective patches from the
> original series, if people agree.
>
> Please have a look and test!
>
> Based on mfd/ib-mfd-regulator-6.10, as detailed below.
>
> Cheers,
> Andre
>
> Changelog v1 .. v2:
> - add tags
> - add patch to add missing IRQ ack register range
> - add comment to document bug in datasheet
>
> Andre Przywara (5):
>   mfd: axp20x: AXP717: Fix missing IRQ status registers range
>   regulator: axp20x: AXP717: fix LDO supply rails and off-by-ones
>   dt-bindings: mfd: x-powers,axp152: add boost regulator
>   mfd: axp20x: AXP717: Add support for boost regulator
>   regulator: axp20x: AXP717: Add boost regulator

The latter three patches still haven't been merged.

Andre, can you resend them for Lee or Mark to merge? Otherwise I
can't take the RG35XXSP DT patches.


Thanks
ChenYu

>
>  .../bindings/mfd/x-powers,axp152.yaml         |  2 +-
>  drivers/mfd/axp20x.c                          |  3 ++
>  drivers/regulator/axp20x-regulator.c          | 37 ++++++++++++-------
>  include/linux/mfd/axp20x.h                    |  3 ++
>  4 files changed, 30 insertions(+), 15 deletions(-)
>
>
> base-commit: 4cece764965020c22cff7665b18a012006359095
> prerequisite-patch-id: 2b5fb10f68e0994071fc4c7dce73db7047c23220
> prerequisite-patch-id: 5d0735de888d155b2c1cdb814e852a5852a17ec7
> prerequisite-patch-id: 29c30894b4bf0b9e1e71de065cabbd842505e248
> prerequisite-patch-id: 0ab87cbf7362b6dc2d577d2264eb9574be47b5f6
> --
> 2.35.8
>
