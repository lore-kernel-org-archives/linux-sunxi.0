Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9E32AAD6
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979460; cv=none; b=LMg2+ov/gQpV+siV3TBrrVTiRgvhWVE+0C8zXbRnRldfhXYlKvH2w3qkFhPhOhS7B7eWYr4g4gq0RGugNhsX0JpmnUUomjhY0hdz4EWX3ik6t3XBwSAGEFORGuEj8B7HJ8Uai8zKCscUbA00MfagOrVb6aRd4EE2HdishJLSAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979460; c=relaxed/simple;
	bh=tbEwkNCQf6x+4iN6wz4q3uzo87s72dt3Fet3XvY9RJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9zPiRevBHByqO78H8J9Crp+8bvPpGCMz62mdkX2Ajrltp5gCAQyRpLH00aSVlp8njcyvmmdNm8SHb3Y884sr8lz7U3yGcV5nOfLHThO32X8xH81aN0UIr+3QkYqW72K8UqSrmmRAtMUXKFzoM1iY3/YoJGwecwGCR8vZ2xDGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFbtCEwO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFbtCEwO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0EAC4AF0B
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760979460;
	bh=tbEwkNCQf6x+4iN6wz4q3uzo87s72dt3Fet3XvY9RJo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=hFbtCEwOkM24LbVlYf92bah4uQK7q2ze7KW3xoTSGPwtrJrLEcBxoSOnMQ8Qg7zMi
	 lcUnEAR3HExCu0JL+KF+hZT3RQXSFurC4gQagN6ObwFZ1yRQZdcb2GPhKWz/aEQ+tP
	 menvcu6vC4S5FPMGbSpsq7zsd4vUbLzN9r9A7BUrGVULsxNVWPgF2fd0zjrTvQ3QwY
	 XOm+XSErSUUifZ6I+8+HwoLzLdsbcoQij9He+zJLeqQkL22V/LiG8xWJkb9VhniMPo
	 Buh7ZBjA0ye0O9miRoLxGVVaxahHYZ0oyvHG/ajiXS/oQIqpugkri3mKoOUd/lPlGn
	 Gx9fI9MVX+0qg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso7272000e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 09:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1pwIbVe8aeBkQn0XgY59INKN6SzqWuuSksy04sR26tMqygINzHLYyrmmO6sQ4cBj/CrqJmvYwu6Y2RA==@lists.linux.dev
X-Gm-Message-State: AOJu0YydgYTwePahn4LAFhVOTKjd1n7MEnyQtVGYs0I41amAEdBWRcTw
	ITHP655arb44Fd+LBY40KC8lZtsuFxryr7TWto08ff/zpcCpyE80mc8285noUodB/pUtaSNFHQi
	4aoVPIxg2bJfvhZ/ZCRayTTlRAXzxtRQ=
X-Google-Smtp-Source: AGHT+IEJ11nUi/9MmADwmPCcmZBwPzpArt3Jo5D+vle9qaT3wF4aJeDOl19wLSdMLL9HBlPWGdrUX7LlrhJESdjTxI0=
X-Received: by 2002:a05:651c:3256:10b0:369:26f1:c428 with SMTP id
 38308e7fff4ca-377821dbd79mr45228281fa.15.1760979458776; Mon, 20 Oct 2025
 09:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251020142622.1849108-1-andre.przywara@arm.com>
In-Reply-To: <20251020142622.1849108-1-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 21 Oct 2025 00:57:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-qirhg0K09g66vA9ZXQJpdfJXk-e01vg_zFGBfZf5wg@mail.gmail.com>
X-Gm-Features: AS18NWAgCYoyEvILfYhDqpNcZIRTeRVwUdsmzoU05hOUQowLutmU9rjJqrvI06k
Message-ID: <CAGb2v65-qirhg0K09g66vA9ZXQJpdfJXk-e01vg_zFGBfZf5wg@mail.gmail.com>
Subject: Re: [PATCH] sunxi: a523: Re-use H6/H616 DRAM size detection method
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 10:26=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> The H6 and H616 DRAM initialisation code recently gained a joint and
> improved size detection routine, which helped to avoid the occasional
> DRAM size misdetection.
>
> Use the same code for the A523 DRAM initialisation as well, which
> suffers from the same misdetection at times.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Previously I would get 8GB on my 4GB Cubie A5E every couple of reboots.
With this change that hasn't happened. Consider this a not so scientific
test.

Tested-by: Chen-Yu Tsai <wens@kernel.org>
