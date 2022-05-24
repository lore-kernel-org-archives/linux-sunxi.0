Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00298A21
	for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 14:55:55 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id y12so18592389ior.7
        for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrJ9O+B95vO2kSLRUxqDzigRuRV4KXloCUh2OONa5do=;
        b=XQF0cB4pQ/W3Bh/C+ohjgtL+X8sDEOsKgZpJIAG45R5siVH9dweE1KwvrDCpkyVUaS
         4txYvNfottxhXw3C/BNj3eYc1PI3n9ez5U1dtgapUGGGyHa67SfDngkwywnZWsJ9551e
         BxH0sBwjBJV+Sro0Lv7/yjwPFsC5GPq8EaosAFouj42LGn+Pk2GNSebInnSBoeBEsut3
         JWA5gwm6xm4JnKTl28yAxjoNyE2miHDsIikDKC7EtDHapUc+uIW6CAQig9ebug2ymZB0
         JY1t6PY6qjzRFaqqAoau+r/QF5PLKqS2QSXBgp5AH2tZp3pPxy6CKOKDlD3USSK9fB/D
         5j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrJ9O+B95vO2kSLRUxqDzigRuRV4KXloCUh2OONa5do=;
        b=pKARLSCZtC3f8nxilm+ldkxVMkv5d5xaux8rJDZKDIX6vsMWwjgzviW6OcKMmZdE8j
         kkMvy8Yn5CKPoB+4fU8vBrTT5EggNvaxLXjpJRes2TyoUrtuFAKYoq+aw3iMBXIicIRB
         zHjh++VovpRqvCkUNjYTzpi+mWIZ+w5ZZxP+Ti5NReven2Lp4EAN4hXGJubavDg/Dg5G
         TIId1WHKqSGgVGvccGrShzQYhjDLs5HwYdTIUQgtjXd5av6K1qKVNPKT/984mf4yKHWd
         KThUjw57ddzeA4imQTGhewi/1AcFLnL9vUzjeQ2wtKIJPkLfHk9wv9aO19nTFVTB9Jep
         h+GQ==
X-Gm-Message-State: AOAM530XVmUaO1C1Hkb8buGoxPsYdywynt7hf0xT7Tjm8Pji8YU0oO2x
	w0QyJntI9kpXgspzRXsziFA=
X-Google-Smtp-Source: ABdhPJyeIhKTaluzXqzFpMAagRHk5c7f6fLgzJwOYv9TRT1bOTP4PRvaaPuJtDyK7ZZhM69/ApY5zg==
X-Received: by 2002:a02:904d:0:b0:32b:f02e:4046 with SMTP id y13-20020a02904d000000b0032bf02e4046mr13798486jaf.44.1653404155118;
        Tue, 24 May 2022 07:55:55 -0700 (PDT)
Received: from localhost.localdomain (wnpgmb0311w-ds01-56-195.dynamic.bellmts.net. [142.160.56.195])
        by smtp.gmail.com with ESMTPSA id y20-20020a02a394000000b0032eb25cd33csm2471184jak.78.2022.05.24.07.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 07:55:54 -0700 (PDT)
From: jassisinghbrar@gmail.com
To: Hector Martin <marcan@marcan.st>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Anup Patel <anup.patel@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Mun Yew Tham <mun.yew.tham@intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/7] mailbox: apple: peek_data cleanup and implementation
Date: Tue, 24 May 2022 09:55:40 -0500
Message-Id: <20220524145540.363553-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502090225.26478-1-marcan@marcan.st>
References: <20220502090225.26478-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jassi Brar <jassisinghbrar@gmail.com>


Hi,

> The mailbox API has a `peek_data` operation. Its intent and
> documentation is rather ambiguous; at first glance and based on the
> name, it seems like it should only check for whether data is currently
> pending in the controller, without actually delivering it to the
> consumer. However, this interpretation is not useful for anything: the
> function can be called from atomic context, but without a way to
> actually *poll* for data from atomic context, there is no use in just
> checking for whether data is available.
>
Not exactly... the 'peek_data' is a means for client driver to hint the
controller driver that some data might have arrived (for controllers that
don't have anything like RX-Irq). The controller is then expected to dispatch
data after "not necessarily atomic" read.

  For example, a quick look at some bit may tell there is data available,
but actually reading the data from buffer may be non-atomic.
  In your case, you could already implement the patch-7/7 by simply calling it
peek_data() instead of poll_data(). Its ok to call mbox_chan_received_data()
from peek_data() because your data-read can be atomic.

Also some platforms may not have users of peek_data upstream (yet), so
simply weeding them out may not be right.

thanks.
