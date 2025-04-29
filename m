Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A2913EFF3
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908197; cv=none; b=n1r8rbY0ftiEOzX74/DPPs56ugpFvx12q/Byq+BNA0yti1jV7LpEZtFHGEMQ5jN4/E7abiXRNYn0F+/1ugIe9cHStplmbl1PUvP+w7pqd/hWfiwnsHQ9C7FmA1NOBnv4qC4BJ0AY4AFqIDL5mgonfeB8gqzIO/aqbMqLYFhjZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908197; c=relaxed/simple;
	bh=W/m7/Imj+obxGg9RuFXw3JMjq4qnYP7Z28h7gwt1NRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gomGOfGP9v+piz3uhIQlwbbSKl1WnqgKjZN36x8w1ZgF3CxUTBDBSIHonPF7MPZdl/44yF85Mi5MHHbl4eL1DaHwh09q20XUcBHVs6XJZAC6/An1Po8vjXGwx0/bmyr2Qc+nTUMmS25ZO8TulADvUcExLzWaP7oCOk/+Q5kHMvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FDWOQAlJ; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FDWOQAlJ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70811611315so48357037b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745908195; x=1746512995; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6qZk9nBrDX1wDz4c/UICbdfNR3rEb0aC4H5e5ravO7A=;
        b=FDWOQAlJzXh503tFH7rMRFrPMMuPNm4/uk0qZAeHvf6ikqtIfCNS2uQcvIovPcLjAC
         RUnD+ze214Q7UCQHZU3RHSfMVMFHnR3uP0Ry1kqNNaqXSRVuUSr9BIT414AIxJC0bett
         tkUEbRkY9hqJo1xbhjCRuLy42pw0IbpyqVWCEk4OLXrzME8xs4M45r+4D9TuwHVSLHbQ
         dbfSU9CO0my5SOq9iFOhZuURC/m9jeHF51X5k/hoyyfrIxqk6NGQH9Hw8lieE95xmE06
         aBMMc7oHFUBBt5MpguYiJbu4DHVS7E8GaWT6NDGwatUSVCCPJcHrJTZwQlZVwlftWCnJ
         x4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745908195; x=1746512995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qZk9nBrDX1wDz4c/UICbdfNR3rEb0aC4H5e5ravO7A=;
        b=FuCZVPvuiEkzFlWJ1G9kus0JYTf0Ef+iibM2YwimDBKz9j3HmsZ1qlNP5t3WSq2rw0
         96ryun/U1/HXtWlg4LkjEqxZitQooY56jymrtNf5YEgrZO6VGqPOhbxQymq0m1r/qnLG
         kiFPeHueVB70xvcLwcdK9UR+zrYOirkGR7Wei6cqKMwSsq8/XLATCYsxTtMMtzwNaMjx
         mX5UXSLvpXTEywEy0oGf0zxh5pZeIBw2Yia/5kC4/GSQPF1Cfs55SBRXLRadzlDS9F2t
         qI7S24MjSON9/tiEIsa1B2PAmad+VRXdp1jQORqlKJISMJtVTWK5OwrSlfKQyDTyiLGU
         HY5A==
X-Forwarded-Encrypted: i=1; AJvYcCVHgC0wZEBnWlYXv7bimFUhZjIwqiMLSor3jC2LrTaZHLQsXeo1o02PKC4cpbwfA58JGqtfJ/I2w1zRxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGz/b6v7zTEMwR4/2Vw+9ncAvW8Yr3Acc5dPM0U/YeeyV6s3FT
	CPdpOk2O+YJN8+0u67MerJIGtQf6iaR+NkU9PwmnK5K9/qM9/O8xbYGo/UzmqWEgxb6Z5ejPCkE
	/g8ZRX6bSUFjUH8Km/COlI5YNEXZKV3U1LVE6VQ==
X-Gm-Gg: ASbGncsiK/UWZ2Ovlhskupvxhs+1u5sTdEq9NF3XCBi8ajd9ILLECjwmAUc8+B/Z9gV
	7JO3ajVlskYMYLK/2Zrt4hhYbaqRYxOWUmM23ZCRJ/6Syhim54HyTlznLEdtlxPISct5JRG6K8Y
	TSOYArgxuEbXQk+BDxj19K3iE=
X-Google-Smtp-Source: AGHT+IHw4yhHHBVQnPfa2kB+RR9TV0q0VhUou0vGpCeEpoZF6Ur2HNW73zNNQv+kdAI/j3RvAaMw9sBuWj+lF+KC/rk=
X-Received: by 2002:a05:690c:b85:b0:708:2c19:bb4f with SMTP id
 00721157ae682-7085f18d719mr158190167b3.17.1745908194969; Mon, 28 Apr 2025
 23:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250426120913.23314-1-andre.przywara@arm.com>
In-Reply-To: <20250426120913.23314-1-andre.przywara@arm.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 29 Apr 2025 09:29:18 +0300
X-Gm-Features: ATxdqUH00DMRx6GEQ0klCxfbsIF2Km50YjsrbFGq0gS3ql0M_2ElnW-nf0xgTjI
Message-ID: <CAC_iWjJSHaypyJXo2TuUy2mnC=mx+Xg2Te2Orff_JzJ-xZ6oOw@mail.gmail.com>
Subject: Re: [PATCH] sunxi: enable MMU_PGPROT proper page table protection
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>, 
	Tom Rini <trini@konsulko.com>, linux-sunxi@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Thanks Andre

On Sat, 26 Apr 2025 at 15:10, Andre Przywara <andre.przywara@arm.com> wrote:
>
> Select the new MMU_PGPROT Kconfig symbol for all Allwinner board builds,
> to use a write-protected .rodata, non-executable .data and .rodata
> sections, and non-writable .text sections.
>
> This might trigger runtime exceptions in misbehaving drivers, which
> should then be fixed.
> Please report on the list or on IRC if bisecting ends at this patch.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> I am planning on merging this ASAP, to get some exposure and use the time
> until the release for wider testing. If worst comes to the worst, we can
> revert it still before July.
>
> Cheers,
> Andre
>
>  arch/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 99750072e55..f22d347d5ad 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1192,6 +1192,7 @@ config ARCH_SUNXI
>         select DM_KEYBOARD
>         select DM_SERIAL
>         select DM_PMIC
> +       select MMU_PGPROT if ARM64
>         select OF_BOARD_SETUP
>         select OF_CONTROL
>         select PINCTRL
> --
> 2.46.3
>

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
