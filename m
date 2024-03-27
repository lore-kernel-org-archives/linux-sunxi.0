Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C787153560
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711574734; cv=none; b=WuJfLUrJQP+BqeAyGJnZvBorYfgEG179puyfD4lRPE8V9jusz58g7nIUwwTF8ACe8NV0v36wPptAZ+QJGWaYWAfBgXB0B1SCaU6rBIS7VLaf/rKvWI+JhQ9ljTCSDcwmPvwtJGUUR/0hR1Z/PS7Lmsx1K62kjIba+vkshAJJBHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711574734; c=relaxed/simple;
	bh=A3R7PORTOH1ZCk4+Ren4bGvSagTday2Ecp9Q6GNz3ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7W9P/bgO+G73diMQ4UwUq+EP0dGUSk6bbWXHbjrg20HgF3MGqoQSr8CfW6hng6bbA0sIuUpBQ565qCpotrQrMdbiamcGvadEoI+FXKlmP0QUZs1pXOJoeldr5WF8xpN4qO6IoY62ConV0XTLUCc6Sn7GWgp8QWJCKbCB99hUkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCze+05F; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCze+05F"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d485886545so3643881fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711574731; x=1712179531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un4R7YLsM9/K8j+g6A4JR2jGUE6474s5RDHi5cMWT2Q=;
        b=MCze+05FKll5yZnbnCV9TO+kgwK0OwHUlBc3/3nhYbRoqE0NK6zTgF3PKPfEXgbIaw
         JfIZGH1eyLYg/DkOG5co8W5vEwcF+VlE0/F1i80bnwTL5pVqPG1i0IdPv6VwGWywHgcD
         FWjOciHkb1TIAlX2tIWIrwI9j1B5Oi48R8ScOBnzDPtTm1nAwhTbSkMfK83tXVkGaUsn
         F8zvyuLp5s/Qp+tudKFBbvBe/C2oi6/Pl/lXz+c7X7xQyUpO1X3PJZoXQVbPoHcYicIo
         iY5IpXCTvT+ihpPQw1WKcPELlnK9sIwRtQiGBLDaW0PZ+yG2N4ZIWfgxkI+vZupFCAWz
         ozQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711574731; x=1712179531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=un4R7YLsM9/K8j+g6A4JR2jGUE6474s5RDHi5cMWT2Q=;
        b=VOJWqtA3tDot3cl86t1C1Efh0oWH8nyVwocsjb4skcX0zVM5mzbKr2P8bFxnhQz0H5
         fxPMCUVIFF0vRiaPEkt2aoj8xe2AXplSFG/IYU/YV0rnuR0Zg44dRoBA4zT8JChH9D/w
         i5xlvZa6pytalYv1wBS/oAgoNvNFadiD6WZ1HtxVxWg3nHKYsBvTo8Rp9banK5fSubzh
         LA7w+X0Cl4NORbJbuKSey7beKno5mSq4UheJfN9WinUY72xU2L6jbzkvoFKx/1nxXJUS
         8pCHPnADOxlAKnCGF0TQD8Efpe2Zh5N23pUaWeqrJ3vvFSgxPEUh7jpyyCSqcCBaM9AS
         DdKg==
X-Forwarded-Encrypted: i=1; AJvYcCXJyjvX0JW5j+sc0aMnE8ZGNR7Adye+IVt9VTgyAppzcL2tPNrCEZJ5t71rR67u8TsmfvxZKySvoC36UMTKUMYtgLVurN2gnkrAIco=
X-Gm-Message-State: AOJu0YxTmdMEEjghCLEUO9tAeRMfLNtcr2DBoy6pLs00FmLfe2mUR8Z7
	CSzH0YsP0so3tApmeI8jRVEqz5iMhXHXjcEllVnZsxm5B75VjtPf
X-Google-Smtp-Source: AGHT+IHSs1wyNGCnTL05qgATrXG35KaRRYLaTCf2rV+bI+5PydNNMRMDZ52wyDVUp3UeCi0XSJDrSQ==
X-Received: by 2002:a2e:700f:0:b0:2d6:f372:aba7 with SMTP id l15-20020a2e700f000000b002d6f372aba7mr1178231ljc.39.1711574730538;
        Wed, 27 Mar 2024 14:25:30 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id g25-20020a1709061c9900b00a46a71c5324sm5858042ejh.34.2024.03.27.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 14:25:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 Martin Botka <martin.botka1@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH v3 8/8] arm64: dts: allwinner: h616: enable DVFS for all boards
Date: Wed, 27 Mar 2024 22:25:28 +0100
Message-ID: <2381735.NG923GbCHz@jernej-laptop>
In-Reply-To: <20240326114743.712167-9-andre.przywara@arm.com>
References:
 <20240326114743.712167-1-andre.przywara@arm.com>
 <20240326114743.712167-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne torek, 26. marec 2024 ob 12:47:43 CET je Andre Przywara napisal(a):
> With the DT bindings now describing the format of the CPU OPP tables, we
> can include the OPP table in each board's .dts file, and specify the CPU
> power supply.
> This allows to enable DVFS, and get up to 50% of performance benefit in
> the highest OPP, or up to 60% power savings in the lowest OPP, compared
> to the fixed 1GHz @ 1.0V OPP we are running in by default at the moment.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


