Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85D37A4AF
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991605; cv=none; b=jXkm/JWDFtJ0ZhlRzizYPiCrXrEZxekQkX7fLNDoB88qNnd5+NGX7iGaRPx86dIHk+EKNpMKXtiUU6tVx+GC0W3Mw5KKhIXEMd+NCxj3sPzKi+jNBHPg/46nEh9K42BGvoEApnQoJ1UbCsLNMSulBNm/MMG8mulP0rvL5IpDVdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991605; c=relaxed/simple;
	bh=VafAjM9GvmSm0WQZv3tSs+xJooJUV4K0MGUPgbehomM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyOLocEh1sVcid9zD4UHXxoQSxyi3tAIoe0LW46xqFdKCp/BfA9WbA+pQ+c+vzxYjOS2JM8z/ouxaWQokqCBY7xZq9gIlnAFTaNhj8ULQXHAWdhs9og0D9MRCE37QAmhuaA0NDy5JrvL9nAqA3B0QIcMKjrwivE2pxNSy1yf/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ay+Y3f8i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ay+Y3f8i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0C9C2BCF5
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 14:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991605;
	bh=VafAjM9GvmSm0WQZv3tSs+xJooJUV4K0MGUPgbehomM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Ay+Y3f8iPlrX5W8PmBYs6ssvQMWApDuxR/tV5klbIc3PT318plQPhrq01UF4ZZ44+
	 T6SlSW5AcYUK5rBrarqApdix2hpXlgdIGNDDtSGsJHRuigIgCYSznjbm0JPS4qbsNP
	 4+kt7B9XWAn1b6rvUTJZdOd1bbEQPrqRX7wNf1fQmlhP9KuYexCI13EglkdHkI6r3z
	 C2Gm4Zl0/raqIjzG7/+FWMJtvN1RD0nhhuLqoHuvJ4DamuIWRDelBgXx7DibnlEg7Q
	 qBEmHtTt+Tsu3c7DN09AaJml6CoDSq0ZWJbhyjfCJNkNIXc0M7Bva2mjlKYv2Q/iBf
	 2jtRpmYCd0T8g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39389398838so27244851fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 07:33:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92uwNvVzYzXfYsLrcx1Jm8HdYzd+qhn9NBngDbCtkHhfHCPKw5HE4O+MJT/ZbEdKN+K0zKNGDU7NdkWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YynTjZQbIvdAaI6YVgJzeCVVTdr3oB99GRfVhd6cEi5HqkzSWId
	4XQpjorg7Lc0QKEGraA0YsToBiyt5hhCX9dFpdRo0MQUkvr8GlTNvlmuJzB5SnXJd124qEWj0n6
	UCjHXqDN6D/dyngDT/jFB/8zKP+uJQAs=
X-Received: by 2002:a2e:ab19:0:b0:38e:2fcc:78fe with SMTP id
 38308e7fff4ca-393783c5ceemr71395341fa.3.1777991603808; Tue, 05 May 2026
 07:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:33:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v66hSwJ4iLw0NVt8nBEJrxLDEkEG6RY5AUPk4xCNaCPSqw@mail.gmail.com>
X-Gm-Features: AVHnY4Ifto1Y_uT3p-KRM-eZu4UBL0La2pOqtqu9YFPG7dOw9V0seprSTLn-VlI
Message-ID: <CAGb2v66hSwJ4iLw0NVt8nBEJrxLDEkEG6RY5AUPk4xCNaCPSqw@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: allwinner: enable overlay support for
 sun8i-h2-plus pi boards
To: Nisarg Rajput <rajputnisarg17@outlook.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:58=E2=80=AFPM Nisarg Rajput
<rajputnisarg17@outlook.com> wrote:
>
> From a0c7eaa6032748bb79953282a984064a922c916f Mon Sep 17 00:00:00 2001
> From: ixnisarg <rajputnisarg17@outlook.com>
> Date: Sun, 3 May 2026 15:42:38 +0000
> Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2=
-plus
>  pi boards
>
> Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree
> overlay support. This follows the same approach used for H3 pi boards
> in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable
> device-tree overlay support for sun8i-h3 pi devices").
>
> The -@ flag populates the __symbols__ node in the DTB which is required
> for applying device-tree overlays from the bootloader or firmware.
>
> Boards affected:
> - sun8i-h2-plus-bananapi-m2-zero
> - sun8i-h2-plus-libretech-all-h3-cc
> - sun8i-h2-plus-orangepi-r1
> - sun8i-h2-plus-orangepi-zero
>
> Signed-off-by: ixnisarg <rajputnisarg17@outlook.com>

On Sun, May 3, 2026 at 11:58=E2=80=AFPM Nisarg Rajput
<rajputnisarg17@outlook.com> wrote:
>
> From a0c7eaa6032748bb79953282a984064a922c916f Mon Sep 17 00:00:00 2001
> From: ixnisarg <rajputnisarg17@outlook.com>
> Date: Sun, 3 May 2026 15:42:38 +0000
> Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2=
-plus
>  pi boards
>
> Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree
> overlay support. This follows the same approach used for H3 pi boards
> in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable
> device-tree overlay support for sun8i-h3 pi devices").
>
> The -@ flag populates the __symbols__ node in the DTB which is required
> for applying device-tree overlays from the bootloader or firmware.
>
> Boards affected:
> - sun8i-h2-plus-bananapi-m2-zero
> - sun8i-h2-plus-libretech-all-h3-cc
> - sun8i-h2-plus-orangepi-r1
> - sun8i-h2-plus-orangepi-zero
>
> Signed-off-by: ixnisarg <rajputnisarg17@outlook.com>

Please use a proper name for the author and Signed-off-by.
