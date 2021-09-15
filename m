Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BA43FF7
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Sep 2021 18:07:47 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id v22so2589261edd.11
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Sep 2021 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0arkSGpeZ9q7BSim6dbEoXgwCLfQDOjW2psPoEAWhRc=;
        b=AjOzX5F1MkIa4+98A3q9esXLOOZOqEKgF2jCTQqZDhvofGMlsXcWjjB59/ZCCsAtNI
         tkbXcUooteuAlQDqh+7i9Qg5CFnW8yqy5iFSpNm+W4BKv8iIahbB3NZSwWaH/zst+xxt
         trOYDEFi/buolVyfz3v5g5GbFualePxbcEMvnLTSK+fK3h48UHyxDutGWKlvfBfF6DAC
         Emz5QhvlrQh/8cNyPzrtKHhBM+FvZuFSsv3/Zf82tqoWGgqVjbNM4+blrYOZ10DU8sxN
         +ZHruMTisHhzddRwyNks0DX79pgndYACXrHO7yqEGOZi2mORfPjTo2FGZdl6FQNRwAxX
         aOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0arkSGpeZ9q7BSim6dbEoXgwCLfQDOjW2psPoEAWhRc=;
        b=NH0gXt5juC3P/3aSuC1GlUpP0eftx3i5zsbXEX33lyIa1Maxpes4BoqQntBfLDp2ZX
         WYOog3i6603pGmr78KBy4n5JMONplhvlfnNNbbiXThj4on5AFhPSCQ+La0V7tyYmCPDe
         g5rI/tcRoOk77+BtHbA/feiNwfHkmPkH+fDcDK23VU+wBvtpuXLNBTU3szoXDBiI+fH+
         AGltYzAVUOmkP3FfdvgSFsaka6FppSdtZmiQsbbr73vJh6DLzuCMAAQbha9h4g0hVklD
         F1z1k/ixEixmoXnFRrsmBrc9+meLWAz2tFd/KdFJ4KoTRqe6fR5kZQFROtqOB97UmXjk
         SAcw==
X-Gm-Message-State: AOAM530TEU1ZJgxxeoVkNRO/7yU5G1Kc7CGtpUgql5/wjhQfhbNjiSFf
	ND7zunVCsYzQ7Z1jnho1ZHX9SIeG/E0=
X-Google-Smtp-Source: ABdhPJx+eD3xrXgAeONz+tH9IzFQBrViB7NAdSdvMETE4rjOpsflfrFRYsbMoD3nWWC08lECADbnTA==
X-Received: by 2002:a17:907:75da:: with SMTP id jl26mr1420777ejc.300.1631729265544;
        Wed, 15 Sep 2021 11:07:45 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id f24sm345654edc.40.2021.09.15.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 11:07:45 -0700 (PDT)
From: "Jernej =?utf-8?B?xaBrcmFiZWM=?=" <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej@kodi.tv>
To: saravanak@google.com
Cc: linux-sunxi@lists.linux.dev
Subject: Issue with fw_devlink=on on 5.14
Date: Wed, 15 Sep 2021 20:07:44 +0200
Message-ID: <5570111.f9yF5Hohu3@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Saravana!

I noticed that in kernel 5.14, at least on Allwinner H3, deinterlace driver 
doesn't load anymore if fw_devlink is set to on. If I set it to off, driver 
loads and works without problems. If I remove interconnects property in DT 
node and use driver hack instead, it also loads and work ok.

For reference, I speak about this node:
https://elixir.bootlin.com/linux/v5.14/source/arch/arm/boot/dts/sun8i-h3.dtsi#L153

Do you have any clue why it doesn't work?

Best regards,
Jernej


