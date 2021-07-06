Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987870
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jul 2021 14:23:25 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id t3so28201318edt.12
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Jul 2021 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MqmbWDsCUjs9C+qMhNJw27Jib49PIndzfqYXInf8k7w=;
        b=RB3uE2BUIUP+XIzQW7caBc2eCPGNGDw58V3QidtrT4qR7dRxFPtrOM5A1dbG4RBcea
         SdxKRAxM8MwhGVZ0L4lVkfZZxPXdLg6ZhgJQ1viBT6tfeYoiAyYDX+5TzkAJP5nyGK9S
         lmV8n+UBmeuVg1iVUsJaFhP+9FW5BhlqplKC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MqmbWDsCUjs9C+qMhNJw27Jib49PIndzfqYXInf8k7w=;
        b=SScbR61L7cBy5XE2W9HKyEA0rhTmKwDONgw5BiwFZo7hFtnOhZXFgqHwvU8UjkuG8D
         pKiequCHn69ZTtY0qBL6efoMcM6zDj7Oh+SIodUK1YOq7aIhE0uBPfARlmN0I5W8Y1fa
         bVK2K0z+yWClmKgR4Fo25XJAVXGMRfDSbG7nm5waxGCrxiWqfdcnxz33PxFxtWV+MfWy
         NchGzkjzb9EXpnH1vE14M0dmcdbdCuj6XNo9B35hrqzWxxL5EXPwoyEppebJ94B0GCVV
         4RaFQOcAEJr7AKEK6vJVsYyqZYVTtpVVGcEeHyOPsM3v3/LKg9yHt6OxRd4N0zNcn+Eo
         KW5g==
X-Gm-Message-State: AOAM532FSlQKkNjRFAP4S/u9VdRNFrYCrBbJDz20kiesJ4ANEjx7kh4g
	Fzb5inmhdOQJZVrYu7Qn+gR40HXbDzDWfbDHBmEQaQ==
X-Google-Smtp-Source: ABdhPJxzlLO/SiynbLnVmpoZk1tsbkhXwn63BYnMTXUWuzP+y/GXJhjifwEBo6rOa7KZsHNfD9tAVDidMqA3LgdDWQA=
X-Received: by 2002:aa7:db16:: with SMTP id t22mr23062488eds.204.1625581403611;
 Tue, 06 Jul 2021 07:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210705230445.14834-1-andre.przywara@arm.com> <20210705230445.14834-4-andre.przywara@arm.com>
In-Reply-To: <20210705230445.14834-4-andre.przywara@arm.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 6 Jul 2021 19:53:12 +0530
Message-ID: <CAMty3ZCWnwKpXzDBMo5JQsuC6_r0HyG9r1bzoMdZiD0Nd+hyYA@mail.gmail.com>
Subject: Re: [PATCH 3/3] sunxi: OrangePi Zero 2: Enable SPI booting
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 4:35 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> The OrangePi Zero 2 board comes with 2MB of SPI flash, from which the
> BROM is supposed to be able to boot from.
>
> Enable the SPL code responsible for finding and loading U-Boot proper and
> friends, so that u-boot-sunxi-with-spl.bin can be written into the flash.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
