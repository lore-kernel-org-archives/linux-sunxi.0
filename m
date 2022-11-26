Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293127E
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 21:59:41 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3691e040abaso71720117b3.9
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 13:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/dQ/AL3GhIvg/IGU1TmUg1kijFekoVJBnMdB4tHzc8=;
        b=mhl2jGiXqfl83oDCA1CRqw9XstvZ97xKDcIOgo9OGhG4fQKKOFjpjMuwWDZc8rK3C5
         MXgbOLTKSe8QxRD393Wa5LCSXlQJsEh7PbT7CMBGglk2Jla88ZS7OmdVvfrg6YQGaC1A
         s+W04vPdDbSZ8j+jSuryPs460b21SaDpe7ShcrnH8NKx1VEvB6VmXCwb1lJEnBr72G3A
         FTuOoypuJDAPCnSg/omVtOG7yeErceBMn9tQ/tS2LoSksbxOdwBQ6rSnKVPk0VAk78Nr
         2R+rP4X7Ru/ciVuysvqG9QaVFIdgxDI9jcvIIzKg29C1GzaY9rj+yKQ9YdAupJE0PAjY
         X5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/dQ/AL3GhIvg/IGU1TmUg1kijFekoVJBnMdB4tHzc8=;
        b=tSEOo0PaxSLUiOGjrySqWR/JdyzgIgS+JrCwfIHcqt7EetFTOpjDB3+Bpl65tDZ4dE
         Q555jxdLGqVA1sR0UG29Qalcp7RievdtYgi9wGT/r+C3zHEFdo2puYkYESO6xeU0Z1/t
         1c4srQST8R8HNd52x07goTkOlmXIuh7lx1fhRX21mrJLXaOk3lUtk/jIZMHFdtANl/jw
         zxFdLEiPVcFIQ8A7onxka/WCQjmYlNQoBTdAT2aye4wHy/DFQfiPVM6q3nHQtWyuC6Nr
         vveExdRCyKDAH0zVGnwrvZ6t9t/zZPCa983LtgQAtLKRMJ69utO/HjeNRfxs4crqMcWQ
         vIFg==
X-Gm-Message-State: ANoB5pkb+zukp8YiY9jg5DuSSETvjmSdwgeT4ewURqG5i2Qv99os+vit
	v1uzIM9XFkn1GqjyV5yJV4NknQLoF9mnYtMpglsh7w==
X-Google-Smtp-Source: AA0mqf5HWHKZ58JKLQNVM9mMIEcgOofezD/C1oF5+FTMAsQmkLOrgsEE1hY2f/X4s9cuBF7m4EpmjOKXYlNfuwZYZQs=
X-Received: by 2002:a81:3855:0:b0:38b:17c4:4297 with SMTP id
 f82-20020a813855000000b0038b17c44297mr24953109ywa.446.1669499980172; Sat, 26
 Nov 2022 13:59:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221126191636.6673-1-samuel@sholland.org>
In-Reply-To: <20221126191636.6673-1-samuel@sholland.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 26 Nov 2022 22:59:29 +0100
Message-ID: <CACRpkda4rmNgM9BsTph9_f_2uX6OOEjC5NZPhBL9S9zvQBLrqw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: d1: Add CAN bus pinmuxes
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Fabien Poussin <fabien.poussin@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 26, 2022 at 8:16 PM Samuel Holland <samuel@sholland.org> wrote:

> From: Fabien Poussin <fabien.poussin@gmail.com>
>
> The D1 pin controller contains muxes for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the pin controller
> is the same across all SoC variants.
>
> Signed-off-by: Fabien Poussin <fabien.poussin@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch applied so we get some linux-next rotation on this before
the merge window. If someone protests, I can always pull it out.

Yours,
Linus Walleij
