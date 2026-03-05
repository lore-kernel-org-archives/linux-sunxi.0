Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA832B981
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697040; cv=none; b=lNNIPvls6yDQxD8Q1kpixyB7vuU0ob0+hAJN9Slrz+eE0Y+8OMm6/21A3hcebt8SFRfRBDgCldzy+BMvAKIINjpuoWx+x0Lat4JG4jNzqnWqKjdMuJ+VLHc/3Tk8OS8PPtyTKFDalmNv6npQ9i6fE4YhnJs/ax8DcKD4zSEalwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697040; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hypgqn6izJhFbMVaCLSdXh0W5F6Lpn28+CtB4vWq1NoKltaVQ/PIdiiGPboh+A+bj97X8CDrFZSfh4QXCBzTcaX0jRNY/9v23VnYZiFWa/L8gpvpKl5ZzGZo0fRoM6uiGHjOwt8LM0/ag07becukOUNT14GnUzGJeuADZtCxZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-506251815a3so69095171cf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 23:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697038; x=1773301838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=T53auLYET52GnIrHMh5hCFeTruZhaGvzdW4M6A9q4CY3EMAiHhHLwcQfgLqGm1TR7p
         3ibRiCHYCKBOGuG/x62+2DD77oU+fzB1HVD442v6W2Fs1/epIwDjYZp4TuctmtYqFm0s
         gwHKxKa8B+5Rz/yFSaJog9SX0N5ti9GviJcLkceNkGL4MSf8ejPOnlpfqmdxfIiysJsT
         mk1af5ZJRu5MKcy4PqRYM2RRaYIhtZEAdRUqbujFv2Nwt51bbqKXTKJNGRLe/VuutlFl
         iItePi8WFg/JjTd5j4KO5OLVwjOoMKiZtnWsBfflasnzk2ZS1NY1sdkX3HTvq+ICRz6l
         bzLg==
X-Forwarded-Encrypted: i=1; AJvYcCXwMjbqyfjhIQSdt0AiXMo3e312vTZsZSwYNKvz1k4wH6Ko959ON+T31k7/tq2nXc7XyxylsbgCq6ToeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxji87e6Hg8W80wt09DCEcoJNSwK4PrgV9Rsxsi4LZbS+OVuzJj
	a0JrbTswUgB43QfTfhRffYSPCHBjVm3wzAkzJAPQlqg9YFBKNv2NlmDbXS6DRijF
X-Gm-Gg: ATEYQzwhCzxcTJow4r/0vcOI9GvM46n3HkybVuPewITnQ505J5WgaPhGlUuTdHWG3l4
	yY/t81pimh9cMm1zq07Jrji2cXrtA07/lqURiBkEOUC52/Ni8XvMgbduQ+Bu0GraHRWLQaAorDy
	ApxNJy3xF48yiVK0EBV1RdbqqdiesEB48Ei68PtnvEtdmAT3BGYbKaVPyVtLPLWPuAwzXvSP7J5
	LyyjigYFK0uOwx+p2BWoAgUn/c3StGn7KtLDbcuXlg7EjDosdozXkQAk92TqfYUYotW281Xp78S
	GWhfleSVr9CFrOKbPIOPC5wLeEicDzRX2uDggixjM8X3stxaC+PZKQZGzwpTyPzmIncZTUCx3eV
	K+IwsgioHZGvYiRuYSBwyIWfCSf8tP8HKEWGxxAXvxCNjFT99LXd9a6ElhxJR6qBmSYkA19YzPs
	Bt3a1N0XbE2EI9TsDkxSqa7JQBikAwsbCDJcx+w9iLwtlHlyUbH7ZFpRcEVJv4
X-Received: by 2002:a05:622a:1ba5:b0:506:2041:13db with SMTP id d75a77b69052e-508db3635bdmr68830551cf.49.1772697037714;
        Wed, 04 Mar 2026 23:50:37 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf73451csm1849993185a.47.2026.03.04.23.50.37
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:50:37 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899fc265126so56612836d6.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 23:50:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU73ONaPkCTwQRYcFPKxLPtnwiDAlADcgGSXxbdx0PfrSh2viqtoXA+Pu+zzMdviAY2JLu+CgtdzytXoQ==@lists.linux.dev
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
