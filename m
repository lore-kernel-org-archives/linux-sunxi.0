Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001E1C1F12
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Sep 2025 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757132178; cv=none; b=QBTVh4vRymX2tLjAnDMcdNFYrip+0EVMW7P5ERXFAr/3XbVLmF6f1DhPqC6R+TLeZ1HKkev0ksnfm46k+s0ZH2hAoNf+sMu4LsQodJjcVPYTI3J/q/lWLQYbMVHmC8yTL1nj7/gVvfcYstB1YB2SsmfETx49dqjmqMDUhyZO2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757132178; c=relaxed/simple;
	bh=+AaGa4KY4O7VR1L+5lz7LhtoM1ACUjc5l1vLXnV94tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1fVrVTDK4ftmifCBFq7q6D7zY7RUi8Vf80Ol2E2oAsleTZkbhIjViubP9JZtMRiTtiubrY9KlMBdOi9++gZpaaoDA8vsjmBN9IApClL8y0t9Nu/9SrbRDEfTWrK5kesmpocBKrG5QKCqUBuwnGChu7iV286Bl4vRraepbZyjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5608bfae95eso3111475e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Sep 2025 21:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757132172; x=1757736972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AaGa4KY4O7VR1L+5lz7LhtoM1ACUjc5l1vLXnV94tY=;
        b=odqzrdxM7b/qD5rlClAR/K80hz6iDqn1/0s5SnLvmtah2Vz0eH6y9UgNW3cbG3JaJh
         GG4ZVCH6upFWnMwFloNI/nPMXQsFl2tDBkH31oZGpomYh/e6ORe2k4fXwtFWTN8athJM
         sx51UeFTiZ/cVTAe15CZyKPNYn2KHo241CWvM3qsk4ygZ7vOFNFMTPjYGYY6zOLEdhaE
         yJdb6HAWV8G10CrIjCLFFB3kX0zUKFAkTC7taGMaJv3ksnQhZAviNGhGyVgp7qJAuY9v
         1RUKI7CLgl0Dh44DGbW/y08pcp3Zj6GZB0aJbdxLezXz14ADOEgdyoV+WrbZyynd+Zhe
         K49w==
X-Forwarded-Encrypted: i=1; AJvYcCV4kevpSx8bcs0K66s00bZ2r40W+Mi5lcLz9IfmrM9XvaJRkoM2PPKTvuLkvelPO8DE2sOGRRdG9dSB7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWuKIOF4MNwQa+b37GycKW6rVcAD3wf2pJcSSbUQ8XgGvNn0Si
	TpGqhw79+zDbw2ok9kub7a6SpUCvg6dtPLT1qlArVny8Nal+RQ3VvT7lRjSpXBEKxXg=
X-Gm-Gg: ASbGncuUlefu0IQND4esMZwJUihFNvzW+d8OpDoueR6Ep7kHsoPzsYzCjFWTDna32jr
	jY1WXNeZ/PJzDgyCoHW9IXPiAxM6uoMDdka7TO5DQ131KgfBbuDhG+CxW/jHWCSl5z3KzfqYzBL
	XucsZlxtCNGqe22TYTE4Ra4bZqf09bMSnuBR00A/DgfMb+S8fY+xilSKFrjjCrOh3GABqtUbidI
	58T8ipGUIHSoVNpZ3elb8zlXgenPROK4eOucOBs+2gWaZFsywbVRbxbo1H1XUpA18PrsTWWeIiv
	wzGpIGJnChBSxVb6Zy6cAv4+ShbDZIjMfgmsNTsnpPYUdwv4jvrqe9ChmjdwOOmHpKOE5oIs4FW
	iqDNvWhMXbNpvX+WtqaFe9EOQn/uJOoww/72As1AvSxqenCEc+U05QPM=
X-Google-Smtp-Source: AGHT+IGNusYmYe2hwA4EF2Sb4RIr3f7J0a4+patQ/Bvnzbd+wybw+4f+oD3ozdbdmO9n+UGWSLI2Rg==
X-Received: by 2002:a05:6512:220f:b0:55f:4c9c:27d3 with SMTP id 2adb3069b0e04-5625eb95700mr350708e87.10.1757132171412;
        Fri, 05 Sep 2025 21:16:11 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c71sm2103457e87.73.2025.09.05.21.16.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 21:16:10 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-33ca74c62acso368801fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Sep 2025 21:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeSBCoRa8jX3MrbmhodycEf4LPx/BuwFy0m7Mq/bARJ/ON6QXnWHHGXRk9TEVbOd3OHkVL61KfdFeoNA==@lists.linux.dev
X-Received: by 2002:a2e:a547:0:b0:337:f786:2f4a with SMTP id
 38308e7fff4ca-33b4d8cb2bbmr3431571fa.18.1757132169950; Fri, 05 Sep 2025
 21:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-3-andre.przywara@arm.com>
In-Reply-To: <20250903000910.4860-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 6 Sep 2025 12:15:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
X-Gm-Features: Ac12FXxA73ZfGI4H5Rgtw7dq1dOBGNO-B8ktFeY3H3nm-PBpHd0UB2GulbKMsHM
Message-ID: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> A few of the Allwinner A523 CCU clock registers introduced an "update" bi=
t,
> which must be set for changes to the other bits to take effect.
> Of the three clocks where this was used, it was always bit 27, so we just
> encoded this as a single bit feature flag.
>
> Now the CPU PLL also features the update bit, but puts it at bit 26, so
> this flag trick won't work anymore.
>
> Add an "update_bit" field to the common sunxi clock struct, which takes a
> bitmask, so we can encode any bit to use, even potentially multiple of
> them. As uninitialised fields are set to 0, we can use this as a default
> bitmask to set, so can OR this in unconditionally.
>
> Change the existing update bit users to use this new encoding, and add
> support for the ccu_nm clock on the way, since we will need it there
> shortly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
