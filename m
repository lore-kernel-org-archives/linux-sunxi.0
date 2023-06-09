Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2E408C9
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:40:57 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30fa23e106bso702128f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686343256; x=1688935256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMRjPVdJppeUenQM2C6Y54Cl7fYbF4Th7sMwT2ipdVw=;
        b=PkcvLljIwko8ekl5XqJ38FdCnaE96T8bWs0yoYp0DmbQV0yeyLNGOh55BoBBYavoqk
         Rkhfk7/Exnot4wCHeADF0OCAF5p0z3AzYPcJWCd8Kk2CwYbhMpzx7vu5D4143ameEQ1d
         o9G+PD1MsPgdxVblFqELr0XKDZ4F8jq02sGzUA9nSvEsJtgXenTfKq0Ff+7MbFo/Lj4A
         keaRiD0CVzQ5vGcdTF4/YD2Mo80nrcSLFQS3G0G8ot1XraYIAZpLfXFqUujfbXr8Waoe
         4YcFc0kcoU8UJiUXUiIEi4+dqCgykWFY8BeCc+TLR0haVuZsijzMFuMOZkeFvSvZ+E2S
         RKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343256; x=1688935256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMRjPVdJppeUenQM2C6Y54Cl7fYbF4Th7sMwT2ipdVw=;
        b=g/PNRCfbnPXaFEMg1S3C/bZ3aCe5Z+e9JjlefpXeYeuu7Zw18oWK8qYxqV7oWS3joh
         8jcKQe8xGylVfcyQTdLvzkfvpAI3fOpZs1CnIg/qpfwUHjVaQ2sRH2FQ6HrZJRZT64Ts
         zKaW+G+yhuNYxdN4N/erjyAls2V/CzpTW7lLJWNe4m1ejD/uB7+zV8X6VOLRiPtaJ0JY
         A/Zt4kcvu2skFHHUZOBplSJe6Vw6URmMRnDPpe4TRXN8D/uAtR03HOsGEGP6c0SjXKO9
         tt2G94uvBpWwT+nwGBFSkq9Zk8yxeZtWevxiXgiD5ssIqTlviVtEeqyPxCmPqd+SEOYp
         LwjA==
X-Gm-Message-State: AC+VfDx7HSXTzrHTaxkT3dYric3v2tI/Dg57KVXjQBWI3yxGlVw0LzXY
	ntRngqTRgIr0J2e8sjYjUccUdeS41ma3Pg==
X-Google-Smtp-Source: ACHHUZ5sJOjUqpHZyJO+T7vwrS6lTatmAqavK+5rhhXFUesCiqWGRqgDf7QXCAXnXN11zJUp4Dsb6w==
X-Received: by 2002:a5d:564c:0:b0:309:3bc3:7d25 with SMTP id j12-20020a5d564c000000b003093bc37d25mr1500087wrw.62.1686343255698;
        Fri, 09 Jun 2023 13:40:55 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id cr5-20020a05600004e500b0030c6751a49dsm5307415wrb.115.2023.06.09.13.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:40:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Sam Edwards <cfsworks@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] phy: sun4i-usb: add Allwinner F1C100s support
Date: Fri, 09 Jun 2023 22:40:54 +0200
Message-ID: <7534140.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20230609105621.1410483-3-andre.przywara@arm.com>
References:
 <20230609105621.1410483-1-andre.przywara@arm.com>
 <20230609105621.1410483-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. junij 2023 ob 12:56:20 CEST je Andre Przywara napisal(a):
> The Allwinner F1C100s implements a single USB PHY, connected to its MUSB
> OTG controller. The USB PHY is of the simpler, older type (like the A10),
> the only real difference is that it's indeed only one PHY.
> 
> Add a struct describing those F1C100s USB PHY properties, and connect it
> to the new compatible string.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


