Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0523D7
	for <linux-sunxi@lists.linux.dev>; Thu,  7 Jul 2022 16:39:51 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id g1so16225398edb.12
        for <linux-sunxi@lists.linux.dev>; Thu, 07 Jul 2022 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZ6bGCTSYduPCX5Q26BHPCc6+2axtS3otmjoB+0kPR4=;
        b=d9TyqrOdTkgZXDwoyjfarVcFPPKHN+HKcdPPmfyx1nIA9a+kohCsXC/GApZE0M7Fh0
         YYtX2PvZffaN95r9LJle26CiRzvcHYRObDMJmSgHf8kChk4J15ovyEyfCRrbdisYFlQt
         1Qw7RGGI9CM4+gu9Mnk/vPHgFtvrnKB7qQCuwdfyXRGFoql9GwpAgD60srnonPaV0iVm
         H+V9fdiq1VIJg2cRm66+b6M1CwnLTBCjsw+Mh0LSO3ciSO57ndFeMwtDbU/B+R9d7c9/
         C/GUm+5tsAu+8dXhrChKSdN33aFb6Xh9/VNz/FB40huDKbKPmmGzLb27/huHXWVw2nr7
         PwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZ6bGCTSYduPCX5Q26BHPCc6+2axtS3otmjoB+0kPR4=;
        b=6rTkcyOmbSDh6CWKeoU98Nq0iY2vc1fkk5VCcZSeE0X7BfPFk79l35SrPt4mRAWoaR
         v+M9e6Sd1MvwqMt4dns1n7ZTE6JlhdA1iRrl8U/pi5TijdI+Vw8FpnbFHmwG2/6fIWAO
         ONqRjh4j47mpxpyLFYF7WeBoaNRC8HFlxaFmcaLABsYtwEV8nm9bI0TqWhybX20CHSZj
         C/KU0OSOhH5mUAJLO54MeQvQh9ss4ZV3C7wJcXTKv2gXW81nOcmCHr0GFsDkyXFsKf9P
         r+3BFDD4mROlq19u+rXRfclhvrlSzguqRkI2/7XNs4HZGonNjUzuB+fny/m/ZL3nSCAD
         bB2Q==
X-Gm-Message-State: AJIora8cdB8ZzwxbmukA5Ig1lt3aRe86GMf2bJQMdxdiLtBHbpmJUK10
	WmBE/RFwxFLaYlzTqMWcDfo=
X-Google-Smtp-Source: AGRyM1s7GBiMti35T3Z3Jqt+j7fJXLzWaw6kB4stOv/phD3kooyxCr73C1ouHt27cq5QrP8oBlKR9w==
X-Received: by 2002:aa7:c98f:0:b0:43a:71c2:3f7e with SMTP id c15-20020aa7c98f000000b0043a71c23f7emr25312176edt.60.1657211989669;
        Thu, 07 Jul 2022 09:39:49 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b0072a3958ed33sm11912293ejf.63.2022.07.07.09.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 09:39:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/6] arm64: dts: allwinner: Add Allwinner H616 .dtsi file
Date: Thu, 07 Jul 2022 18:39:47 +0200
Message-ID: <2187076.iZASKD2KPV@jernej-laptop>
In-Reply-To: <39537f95-2ed4-f526-5912-364c1c1ed512@sholland.org>
References: <20220428230933.15262-1-andre.przywara@arm.com> <20220706141655.15d2dd0e@donnerap.cambridge.arm.com> <39537f95-2ed4-f526-5912-364c1c1ed512@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 07. julij 2022 ob 08:30:32 CEST je Samuel Holland napisal=
(a):
> Hi Andre, Jernej,
>=20
> On 7/6/22 8:16 AM, Andre Przywara wrote:
> > so after seemingly having finished writing this email, I realised that
> > this won't really help, as I think this diverts the discussion. And the
> > problem has been around for a while, and won't probably be solved easily
> > or quickly. I think we agree to disagree here, or we should admit that
> > there are different approaches ("bundled firmware" vs. "UEFI"), so in t=
he
> > interest of not blocking the H616 series:
> >=20
> > Shall I just keep the firmware node? This would work both ways, whereas
> > dropping the node would impede the "bundled firmware" approach?
>=20
> Let me try to sum up the relevant portion of my thoughts (and save the re=
st
> for elsewhere):
>=20
> The only reason to add the reserved-memory node is to support
> externally-loaded DTBs. By adding the node, we are committing to support
> externally-loaded DTBs on this SoC.
>=20
> Upgrading the kernel is not allowed to break boot. If we support
> externally-loaded DTBs, that rule extends to DTBs shipped with the kernel.
>=20
> If we remove the reserved-memory node, the combination of old U-Boot + new
> externally-loaded DTB will stop booting (the kernel version is irrelevant=
).
> Therefore, if we add the node, we can never remove it, full stop.
>=20
> I will (begrudgingly) accept that, as long as the node matches what TF-A
> actually generates today. That means, please:
>  - Drop the label and update the node name
>  - Reduce the size to 256 KiB, matching (BL31_LIMIT - BL31_BASE)

In the interest of moving things forward, I agree to that.

Best regards,
Jernej




