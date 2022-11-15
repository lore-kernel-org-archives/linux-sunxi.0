Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CE21841
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 09:07:09 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso13222756pjc.5
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 01:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVzHUOg3Tw/oS7PqcIhE4bFaHM91oQiodH+CwJsS3b4=;
        b=cQNzhkJfVjxyKHBWiF4Trq5Tb7qKVSKPLT6h1vLWg7/3Q4RsgrlomSgDOqBJWObhJO
         ekLGK5Yyc2gpBQEs4FHjKosvholJvzPzfEJ1Ay48ZFXQ6XRtgKCDEXtr5gOu5bYEYeIX
         xLHMLM3T6F1sSQy8qXVbYx86hqV9lWWb2KYgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVzHUOg3Tw/oS7PqcIhE4bFaHM91oQiodH+CwJsS3b4=;
        b=a/FxyJ5sQLIyFm38cztuhECINXTfxBGAZIkisFB+X4sMnYs86IW15/ny41rupMFTOL
         IX/GZlRI/7UGG5rq0AeNFtIkNVHEOWE5J5/t6zjnA8fSt3WtXw12aryXrI+0gXhK2sYC
         hz6Qkcaj3vW8L7/WXbRjQAwmpX5xtesdiASPXwuITk2tv9qjCyVQbP+907rDVuh17NDy
         UVvfOn4DNBUrMImXXstIwiBU/jXgIWK6smcQMAoI8StMXEDhFS6hBrJVbZDA509SKc5u
         asE4AfMBtFQ39ZOvZGZSEuJqEDSEaF8en9uPRuGcCziImJXdJtFDxZallCgjQNPuN4nl
         Vi1A==
X-Gm-Message-State: ANoB5pkFc9AWqlToI6A82uzIEzaFNMZi2RnmUnTrjVPlkP16QueEzRik
	oeNk3TBZEef4qnJJhc6DOAk4qw==
X-Google-Smtp-Source: AA0mqf5ZPq5c3BoUDT8xkuFzdF1QmWcMV7pUAtSTv0EFvGqy/jnfrTAIei6OAmdzrPX3VMusoP9+2w==
X-Received: by 2002:a17:903:228c:b0:183:6efe:65eb with SMTP id b12-20020a170903228c00b001836efe65ebmr3224312plh.34.1668503229437;
        Tue, 15 Nov 2022 01:07:09 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4d49:6d15:b250:5977])
        by smtp.gmail.com with ESMTPSA id q16-20020a17090311d000b00182a9c27acfsm3378830plh.227.2022.11.15.01.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 01:07:09 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: allwinner: h6: Add IOMMU reference to Hantro G2 decoder
Date: Tue, 15 Nov 2022 17:06:42 +0800
Message-Id: <20221115090644.3602573-1-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.493.g58b659f92b-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While doing some decoder tests with Fluster and Chrome's VDA tests, I
found that the Hantro G2 was failing, and there were IOMMU fault errors
in the kernel log.

Turns out the decoder is behind the IOMMU on the H6, as shown in the
user manual.

This series adds the "iommus" property to the binding and the dtsi.
Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  media: dt-bindings: allwinner: h6-vpu-g2: Add IOMMU reference property
  arm64: dts: allwinner: h6: Add IOMMU reference to Hantro G2

 .../bindings/media/allwinner,sun50i-h6-vpu-g2.yaml           | 5 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                 | 1 +
 2 files changed, 6 insertions(+)

-- 
2.38.1.493.g58b659f92b-goog

