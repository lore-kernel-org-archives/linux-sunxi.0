Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA78016D4EE
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085080; cv=none; b=ekRNzWQhUY47Rg6men+KO5elvEccaJfVRqI7voWgCt1g+n6YnlmNm8L0hUK2oxLhX8g+V0nV5qV9mUG6K3pPepz1Vt/VAiJSXp/tAIj7+7dg5GeuBYnY6J4725kyXRBITny7BHxaH8itvYEwy/dYUBfRmSfAj7mMOJEBB+DD0kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085080; c=relaxed/simple;
	bh=6BdvQ6T7K3CaZ2blSgGXz6eQG1eUROw0yaG/efO9nxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHWl2tzGetH8ZqrcnnhvUc2xPXRy2kNOL5tZnO/f3txf2y38ToFJhm+PoYityQVTlxqH4sOA2PaDN7BO6fnl7d8n/gfzcf0r6nZ1F49xFMQzQ0LNBuKtZ+L+MfCBVjjwEyIEi9EHM7foqN/4RXE6giXPMW9tEUF5Ee2VEdDRksY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5320d8155b4so6002608e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085076; x=1724689876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1x2FXnkVymZ0+l/V5XpdI7vewTGjXzSX2+6VUE20Bi4=;
        b=jLJRSZp9l/iSiY8IDgmhIljgOi3ThhLCb0zI1RaufVFHECb51y0ouF2mY5+M7iXeWh
         1euJgxiBP35OnKSBKkQzcDZqvvwzrqILqvxIX84db640ZcVtvvBh7/5X/16buf5pbzIr
         +nYeY4NklZFGxzP7GrVZvXbWewyu8sJwnILxgY0TXIcqezF6x9l48otQ2cQRPsq+BaU7
         5H5Z18QW7nDBr1RxZ4lpDUdKL5owHh581eFQjcZ5hQp4VrcaxydhwvtcqI3Iw8L2689M
         yhWQRAkxjFpPNXbhbNkM8bItvvGeT6VAJBQhgur/+m+ZM01q+tIKfoL/OsL6NSmyfK+5
         BdyA==
X-Forwarded-Encrypted: i=1; AJvYcCWQjvboRfw4eRlXN0hmm5KW7O0JnQMo+w+whw7Q5UaEhN3QXvyUd+DJ4e22J/S0DcnMCJYKyjZbwh8pLxjgX5eowwl2XbJwviNDVeM=
X-Gm-Message-State: AOJu0YzwMkNztT6aC4ZcAJNsIlHrqAZ9QCwjkTX3xUr9C3PCHm1riTl4
	w0w42SLjar+PifdqTFcgdSSvF4HLX7oVljZHciSvE2f7HiVdK1JPfz0UgUVW
X-Google-Smtp-Source: AGHT+IGU7BzjDNthuQQ9M7lnVeGfok64IRVrmLnlqUIhXNW90vV6jRxc4gcB/dc3x8xYdabWuiMCWA==
X-Received: by 2002:a05:6512:3b8c:b0:52c:db22:efbf with SMTP id 2adb3069b0e04-5331c69de2emr6916393e87.16.1724085075498;
        Mon, 19 Aug 2024 09:31:15 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3ff3f5sm1551643e87.129.2024.08.19.09.31.15
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:31:15 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f149845d81so46611011fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzbS3Ep73IIoPWMOtbS8KR/GI2eq8ETTNkM7PGyezaXGP2/up/HP1kcilEe4I+wY04pat7GUm1KXxpLbJfChttFm6hGpWnGuiM7RU=
X-Received: by 2002:a2e:9d97:0:b0:2f3:b8dc:7d24 with SMTP id
 38308e7fff4ca-2f3be59a2b5mr70558051fa.17.1724085074993; Mon, 19 Aug 2024
 09:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240816001824.6028-1-andre.przywara@arm.com>
In-Reply-To: <20240816001824.6028-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 20 Aug 2024 00:31:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v66LeA5gV-WTn3_Hyfx2o83_46Z5nBoLV12D4SLUmy0DLw@mail.gmail.com>
Message-ID: <CAGb2v66LeA5gV-WTn3_Hyfx2o83_46Z5nBoLV12D4SLUmy0DLw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] regulator: Add AXP717 boost support
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>, 
	Ryan Walklin <ryan@testtoast.com>, Philippe Simons <simons.philippe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 8:18=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> This is remainder of the AXP717 fix series, containing support for the
> boost regulator. This is meant to increase the battery voltage to the 5
> volts required to provide the USB VBUS power.
> It's the usual trinity of DT bindings patch (1/3), the MFD part
> describing the PMIC registers (2/3) and the final patch to model the
> regulator (3/3).
> Compared to v2, this drops the merged patches, and just retains the
> boost related parts. It also changes the internal name of the register
> to AXP717_MODULE_EN_CONTROL_2, since there is another control register
> we will need later for battery support.
>
> Please have a look and test!

Whole series is

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Not sure which tree this is going through, but since Lee already gave
acks, maybe we could have it all go through the regulator tree?

Thanks

> Cheers,
> Andre
>
> Changelog v2 .. v3:
> - drop already merged fix patches
> - rename control register name to make room for second control register
> - rebase on top of v6.11-rc3
> - add review tags
>
> Andre Przywara (3):
>   dt-bindings: mfd: x-powers,axp152: add boost regulator
>   mfd: axp20x: AXP717: Add support for boost regulator
>   regulator: axp20x: AXP717: Add boost regulator
>
>  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 2 +-
>  drivers/mfd/axp20x.c                                       | 2 ++
>  drivers/regulator/axp20x-regulator.c                       | 4 ++++
>  include/linux/mfd/axp20x.h                                 | 3 +++
>  4 files changed, 10 insertions(+), 1 deletion(-)
>
> --
> 2.39.4
>
