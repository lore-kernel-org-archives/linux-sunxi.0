Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D0A3236
	for <linux-sunxi@lists.linux.dev>; Mon, 23 May 2022 19:19:45 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id j10so3777541lfe.12
        for <linux-sunxi@lists.linux.dev>; Mon, 23 May 2022 12:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6a0BAY6jmrXBJdXOo2MY++BwfoYw3NjDDRYpdznvaYg=;
        b=nu1x1jGkAR5URkfiIOmvwdTmONPXh76JLQei8+UG0jqC4Yv7dboYonH+KeKuF3KJay
         5V9hnQVY6NG5KaxGNGURDUF0RWn5+nbafZ3LpVJh1W6UI6qfKj6dqs70mJjx0Wtqysis
         Lj1WlFVXIerAxvBxiNl2Wf7mhDJiFb49c80JYykae2CCHlY/EnZPwlI3UXCRyK+9aNCb
         3KKvNWpOWPynNce88lM2wLJ6MAfZ7TkQM7HH6VfJQbQfYJopFPwVMcc3inH6+GOg4zrd
         UgvDXBBoze5FgWDJkegY0KzbyG0LKNUmYY8ZN6yoYj/czAFDioEfeZgyBiNqB/APWqo3
         iV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6a0BAY6jmrXBJdXOo2MY++BwfoYw3NjDDRYpdznvaYg=;
        b=mqdmP8vBPaYjSiGHYu/KbdbSFQbcE3IudCr7qSvHgHbOnhs2fFqO3KxBoIXxCRryNI
         NFKcn1C+lUq9Kl99kp5Bmr5nTqHgYt0aMX7w/H9tGQyLP6e3cNZ22mQ6ZdhQJMhik4zr
         8NEZytj1tMHHjYGgIc1O/AHco22np3Qwri5eiPNvsfExuuE/RomGak+Xgc1hM9sNy4aL
         4dIu5DLsjAghdC2LHz8qFp+owPwQ4INWHzWtkBzHHZQOE5M3Sa0taQNlFEGESilIJK4f
         XzP9MVUSbv3MY9VdeYJOOalBqt21hhWwSzX8HOidaPb8N1/S6nBkEtJCBItEF7XpT3Mb
         KPDg==
X-Gm-Message-State: AOAM530iKkeUGJp+585R1iyTL8Fda0JDlcjysuTeRIg9TWvk6QQPaQ8T
	mUmxPkB9XCo79FCXxbXrTiY=
X-Google-Smtp-Source: ABdhPJyHTcfhCQ/LJ41sPtLWtehnfAg8keKD9wL+9Td1qGSEJjP1u4wNcmbq9S+/RsdqBctR7MCwkQ==
X-Received: by 2002:a05:6512:3d10:b0:478:6508:45b4 with SMTP id d16-20020a0565123d1000b00478650845b4mr7751989lfv.334.1653333583816;
        Mon, 23 May 2022 12:19:43 -0700 (PDT)
Received: from localhost.localdomain (ppp91-122-164-134.pppoe.avangarddsl.ru. [91.122.164.134])
        by smtp.gmail.com with ESMTPSA id g7-20020a056512118700b0047255d21104sm2069531lfr.51.2022.05.23.12.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 12:19:43 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: andre.przywara@arm.com
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: arm: dts: sunxi: h3/h5: add gpio-ranges for pio and r_pio
Date: Mon, 23 May 2022 22:19:15 +0300
Message-Id: <20220523191913.285283-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522222630.7faab948@slackpad.lan>
References: <20220522222630.7faab948@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andre, I checked the gpiolib API and didn't find any function I can
use to register gpio-hogs specified in DTS.
But I found the similar patch to the qcom driver. Could you please check it?
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20180412190138.12372-1-chunkeey@gmail.com/

What do you think about it? Is it a good idea to impelement
the same changes in "sunxi-pinctrl" driver?

Best regards,
Andrei Lalaev
