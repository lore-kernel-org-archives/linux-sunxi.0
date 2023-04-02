Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BBE20F5
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Apr 2023 06:10:30 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id y4so105437784edo.2
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 23:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680415829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHYI+tO3hAeuqhb1MWG4+RQipbR23BelUx1lrPVeCNE=;
        b=a5OkNpEuxOqvLVGZx0kGexUQ1fRYoatTppu+mJHBj+oLDVD5P73ThqDAt7vJ4Bt0Kh
         rZOQ4Nu0wkJ6VVx0oeEAGCRs1WNzVgrl3OfTfdp7p4hqyuL6qE5jJKGPlZU8nNArQ57m
         opCof2c2iIn2HYDN1U3YNkgCnTm7TRdkdrDieL7RM7JXwWyteddwJt1AdANtFdLCneD+
         X0SMuYpBwr+CMPPvX/uG4wyegQn9M0U0bMkHUoqUjlYuhwnF8jzRMWM00nizZG4Loo6v
         D4Ox3n4u4WLEaPDaO2xcAz6sPZtpqWKSZPCvoxEzMT8Zr/S6Nr3eDozsUkfwF1+m8lPk
         4Lhg==
X-Gm-Message-State: AAQBX9cqO9WMDJMLnstRYJ7ffxy1L/hnEmIjee10NLdj/3xRWAtXl0Ot
	zKi7v8h5b78qo4WCXJiwbaKpt5B5BHAyeA==
X-Google-Smtp-Source: AKy350ZATn+7AZXId2YX1sj8bf0IrNSmrHFakxaWm7Kgtkjbt9hmsmu6Z474CYjK6SLa8mMYOBcoAw==
X-Received: by 2002:a17:906:ee8b:b0:93e:8791:7d8e with SMTP id wt11-20020a170906ee8b00b0093e87917d8emr22776042ejb.2.1680415828926;
        Sat, 01 Apr 2023 23:10:28 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm2924734eda.30.2023.04.01.23.10.28
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 23:10:28 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id d17so26176920wrb.11
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 23:10:28 -0700 (PDT)
X-Received: by 2002:adf:efc8:0:b0:2e6:e4df:a7bd with SMTP id
 i8-20020adfefc8000000b002e6e4dfa7bdmr646296wrp.7.1680415828140; Sat, 01 Apr
 2023 23:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401001850.4988-1-andre.przywara@arm.com> <20230401001850.4988-3-andre.przywara@arm.com>
In-Reply-To: <20230401001850.4988-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 2 Apr 2023 14:10:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v65QUs1d_F9jTeeHThaWv6Ai28JBHnFgw1ObycN9_C6rKw@mail.gmail.com>
Message-ID: <CAGb2v65QUs1d_F9jTeeHThaWv6Ai28JBHnFgw1ObycN9_C6rKw@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] mfd: axp20x: Add support for AXP313a PMIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com, 
	Shengyu Qu <wiagn233@outlook.com>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 8:19=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> From: Martin Botka <martin.botka@somainline.org>
>
> The AXP313a is a PMIC chip produced by X-Powers, it can be connected via
> an I2C bus.
> The name AXP1530 seems to appear as well, and this is what is used in
> the BSP driver. From all we know it's the same chip, just a different
> name. However we have only seen AXP313a chips in the wild, so go with
> this name.
>
> Compared to the other AXP PMICs it's a rather simple affair: just three
> DCDC converters, three LDOs, and no battery charging support.
>
> Describe the regmap and the MFD bits, along with the registers exposed
> via I2C. Aside from the various regulators, also describe the power key
> interrupts, and adjust the shutdown handler routine to use a different
> register than the other PMICs.
> Eventually advertise the device using the new compatible string.
>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-for-MFD-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
