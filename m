Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C0A939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:32:52 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id ek18so36001379edb.6
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678825971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLFoyfLfdyO7ocn4I91ehlSCtw1QfcrPgCtbPrlB1lQ=;
        b=OZQCXhqLqja/dOED9oYnGh5ZzK1T5CXLPiHRfTPuPsgIqlJxZBwyhxIkcjHXYESffT
         GUzc7tofvBNLC2CG39cmcbO4RpIZFP1pyLyqMmR2vw4arkGWkE+a55fMpvZuTsyxQgPv
         Ic9Urgqyvcp3g+JfyMq0u2Y2D1YCN6+tMAksRo4OcxUO7aYQ4knVnSP4hsIen78KfaGF
         Pu6tc4goaQUKA09AMqN2pAgXHwS+y9a8WDxJ6wdoOpVwLzfLC4K+5OL8HKa08JWI/SzJ
         SL+R938Dks+Y4QJktoWX9ze9f/ky/l39GkFrhPRFAFB/R31io1wmuPAAb/jWf66CbFDA
         5a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678825971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLFoyfLfdyO7ocn4I91ehlSCtw1QfcrPgCtbPrlB1lQ=;
        b=eO8iLEG+TL5Bx9b8xm/QOFuBY7ivPEvTbHsEiMMHvEwOoFhl6IGZRJjju3HbAeQfME
         qn6svvK8XBRwFXpueF4RYdIxHStgv5BOBdYRIHgF1+P0MhaMkqST/CtNnolWIG3TWay3
         U6k1JcJdRjzKbz1HtEuDKk2AGqs4HB9bC4dztV3wY/nSEqyFTpdAiVtLEd9jfUbwovrJ
         5X3Fw9KYB96bFPey68sy3/WZdwlgyuP6Ed/7wJdXd6T2WtNA825P2okvxGTf+6gdmC0S
         BaLdoY2vttzt2JvC1d7dzu/6x3QjV0DqkfkmDC18Ovbt50QF13qlTWkWMO73zmaAgGzk
         zeOQ==
X-Gm-Message-State: AO0yUKWh9ZSfB8L4mj6lIagd/2Re6sv51+CHsbD/OfIQkFTopOw8/egw
	yZ4+M1A4xy79oFYrxx1sCEk=
X-Google-Smtp-Source: AK7set++sOxBoil2fV/AYd0vkfsoNi2NQY+Xq66eS0oKEFztdyuIRLgcGbiy+VyJFSjbI5WVnmFEng==
X-Received: by 2002:a17:907:2166:b0:8b1:7ae9:647 with SMTP id rl6-20020a170907216600b008b17ae90647mr4833331ejb.76.1678825970910;
        Tue, 14 Mar 2023 13:32:50 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ja19-20020a170907989300b008cf8c6f5c43sm1557535ejc.83.2023.03.14.13.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:32:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] soc: sunxi: Use of_property_present() for testing DT property
 presence
Date: Tue, 14 Mar 2023 21:32:49 +0100
Message-ID: <4252460.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20230310144724.1545223-1-robh@kernel.org>
References: <20230310144724.1545223-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 10. marec 2023 ob 15:47:24 CET je Rob Herring napisal(a):
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks!

Best regards,
Jernej


