Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2942CA6
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:37:28 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id h8so23419279ede.8
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678826247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHxQXQUVKaAlufj6InystnuWkNCnVQe8D4VwWl3oonA=;
        b=pfGyCIbrJZwVx0W4DnMi8P4qySG23P8DTfQ6bcWYb1CxLz36VKp+54AYJu5cmJ1igp
         PWSiIa9BAjGjup2Sz+W4XvZItk9qaJzCvk2w+KSwWYrTf6ci9a8DoKpK5lAGrwvljEwF
         9y96VtiuprjcBACb6rwO6UDVD62JxStyvCflmj/5Ek1zjo3yRBuy9dPe84wiAYFld508
         AeT5ABBcpDHOye8ZjLR3WLWMSZEaXo9t2QQelY/Y1uWmak/+UoK5FO6zfANpzV2iQnoq
         tZr/iN4ApdtBZ83RXtrD589xi0IvQODRab+E2PA+PH2g/177gdCU5/DrKlweSCCBbdL5
         9PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678826247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHxQXQUVKaAlufj6InystnuWkNCnVQe8D4VwWl3oonA=;
        b=QhUSUUBiAS+tc3LLGhRhtLovUhFyeifiVJssdonTMg0VdpST9I2M3SN+sjos2ZLr7/
         bG/QAxLtESxx2Bie2NAWH+6kTC1g0lrtcdCiPcS0FmDJ9viL2Nc5UlnjTDzHyyUvRtXX
         0BI03WFs1jhPlVpqMY8mOSXOqtHzNKnzUgZFot9D6bQH7CLqgr5WYuvIrD0acOLDAu0M
         W9A+NhkVvJsjIOmZ5ZkLONG7ASaf0c6BF6jGooqN5iLkaYM8GHx2sTHq5oTpch0yk4/V
         /1dil3wwTMU9S34lAM03HSVR47L/oQLdZDnOFmegsSyUMAAv6ByvUbIkIy4S25wW939E
         Doqg==
X-Gm-Message-State: AO0yUKWJaZ26lmmbtXkOZOXwKGkZj63CRgMZiS7b+4ipTiwRjmvwpX3S
	tMbp0tKYA5aeKoneoQHA3ys=
X-Google-Smtp-Source: AK7set9MyUrTfoBf+tiCtR8jIumRDt5q5MR/AB5bUT5NLEbDK7VQy3GBqHk2efSDZlXaiZPcylNxpQ==
X-Received: by 2002:a17:906:2b50:b0:8aa:c2e1:6a64 with SMTP id b16-20020a1709062b5000b008aac2e16a64mr3642781ejg.61.1678826247125;
        Tue, 14 Mar 2023 13:37:27 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id z9-20020a170906074900b008eaf99be56esm1573648ejb.170.2023.03.14.13.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:37:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH] arm64: dts: allwinner: h5: OrangePi PC2: add OPP table to enable
 DVFS
Date: Tue, 14 Mar 2023 21:37:25 +0100
Message-ID: <1890711.taCxCBeP46@jernej-laptop>
In-Reply-To: <20230228114112.3340715-1-andre.przywara@arm.com>
References: <20230228114112.3340715-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 28. februar 2023 ob 12:41:12 CET je Andre Przywara napisal(a):
> So far the OrangePi PC2 board was running at a fixed frequency, set by
> U-Boot to 816 MHz, which is the best achievable frequency at the 1.1V
> CPU voltage provided by the PMIC at reset.
> 
> We already describe the CPU voltage regulator in the DT, but were
> missing the OPP table. Just include the default H5 OPP table, as used
> by other boards. My OrangePi PC2 runs just fine with those values, and
> now goes up to 1.15 GHz.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thanks!

Best regards,
Jernej


