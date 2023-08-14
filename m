Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FFFAD4C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 10:28:41 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5236c9ff275so5589637a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692008919; x=1692613719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FD+dZC6ILC0zBFJ75+s8TCoV5USuF9fK+77Nw8Aje0w=;
        b=KWdqfZ62xxlrvlMKf2qpi7YAx2rbvFG/rCy6KhPTmVZphJsw4o2qpe1XzHr2ulW9ig
         dJocY4tSGDsDN8BwwO1YOQawk66HkEn80/HhW/9hlO6rOow7AfWW5ejsrLhaPH16P9kI
         wf7SMRXGkVgrdLwcNcHzBNB7TdGjz+ahTGskjF0PqMlDTx7kItkd0xOLzJyi1Kjn74TF
         IZ3bJUC1Dq/EpL3zzYFza3Qn5PV29G9w5keslAkAtcSJCAw/AkZGh8bevjk/lcV5+KDs
         IWxarqq5J8fQu8ZYSNrror9GhedNj152iiEaVa+GX1N6T82hz+c11S0hNGGo6iqScOVF
         mMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692008919; x=1692613719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FD+dZC6ILC0zBFJ75+s8TCoV5USuF9fK+77Nw8Aje0w=;
        b=a8SWsTzDQtXWE2GWMskjr5VL4I/VRML5t/a5EIAtlZbkpG1HEHvwWhjX9ka4/5bgTI
         a1hHaJ/frLmBVCQubfWhIiBgh3cGZO7udc/YBAUULlO6NIr6kiONrqkC70fg6DT7UdOS
         aSVEo/4tLv8AhFIr1yamrrraXSqQK8w11gaG9HBEJ6AouHrt2B/zcXppJFYsDUVPg8yk
         xHRtR0rsKBWBmMyYAHwYVE8XxfosX5P2sGKfaM/gy/yVbyGPWYaXaQtRpvjG1sr4/xpF
         /7jrUcmBUnNPQ+8qszQVNnf58KhTd5oWvBBYNAJ4bsSG66l/4geMJhskSKmyF5cVTgCl
         nXyw==
X-Gm-Message-State: AOJu0YwK4IJvyJpEwiJTmUrnc6avSF+5mI6NSvrFi3ctU9TQ/asvnZUD
	U607uNr0hETaNE/jlxEFqXk=
X-Google-Smtp-Source: AGHT+IGLLfnjCAgn+nWhTlM7HypGsXCTlLNpZzQ1NwgZFCaXqFMayOU8fjnnL5sKdfMF6InnHfyjDw==
X-Received: by 2002:a17:906:1da1:b0:99b:c2d4:ddd8 with SMTP id u1-20020a1709061da100b0099bc2d4ddd8mr6745353ejh.31.1692008919572;
        Mon, 14 Aug 2023 03:28:39 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id w14-20020a1709060a0e00b0099b5a71b0bfsm5490638ejf.94.2023.08.14.03.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:28:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Martin Botka <martin.botka@somainline.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject:
 Re: [PATCH v2 1/2] dt-bindings: nvmem: SID: Add binding for H616 SID
 controller
Date: Mon, 14 Aug 2023 12:28:36 +0200
Message-ID: <5856748.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <DKGDZR.4G4SZ781MVSV2@somainline.org>
References:
 <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
 <830e5e34-f6de-3233-4a12-06c8390169d1@linaro.org>
 <DKGDZR.4G4SZ781MVSV2@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 14. avgust 2023 ob 10:21:49 CEST je Martin Botka napisal(a):
> On Mon, Aug 14 2023 at 10:08:38 AM +02:00:00, Krzysztof Kozlowski
> 
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 14/08/2023 08:38, Martin Botka wrote:
> >>  Add binding for the SID controller found in H616 SoC
> >>  
> >>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
> >>  ---
> >> 
> >> Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> >> 
> >> | 1 +
> >> | 
> >>   1 file changed, 1 insertion(+)
> >>  
> >>  diff --git
> >> 
> >> a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> >> b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> >> 
> >>  index 296001e7f498..2ec0a1b8f803 100644
> >>  ---
> >> 
> >> a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> >> 
> >>  +++
> >> 
> >> b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> >> 
> >>  @@ -27,6 +27,7 @@ properties:
> >>             - const: allwinner,sun50i-a64-sid
> >>         
> >>         - const: allwinner,sun50i-h5-sid
> >>         - const: allwinner,sun50i-h6-sid
> >>  
> >>  +      - const: allwinner,sun50i-h616-sid
> > 
> > It does not look like you tested the DTS against bindings. Please run
> > `make dtbs_check` (see
> > Documentation/devicetree/bindings/writing-schema.rst or
> > https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sour
> > ces-with-the-devicetree-schema/ for instructions).
> > 
> > Best regards,
> > Krzysztof
> 
> Yea completely forgot. Sorry for that.
> 
> Will send v3 tomorrow with proper binding patch using items with enums

Don't. You have cca. 1 month time now, since you missed at least window for DT 
changes for 6.6.

Best regards,
Jernej



