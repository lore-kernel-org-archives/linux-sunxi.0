Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826571;
	b=cPMAyd2nO4JG4sCKFEXIFX/wjy+W8OVhGxsg/ysKGyHZ6cL2eocYxBmvZACLhPhl6QKO
	 pL4dKBffa79bCjANtO1qhZWZnbAhnX/hSg0jlAwdK6rGIdaIcygXDwuaRBcJ7xqTsw8jg
	 LWFrnIfNIj9ehsm4Is5c/mkoJG8jWFUe9VsVjFK3cXpkVj3qk+6vxUAAC99lAoA/3rzVx
	 D2HWPVQL5dRJ1AG09LZ3mTX9Uw9bsX+otHYeSEw5N86M6PSxv5HyzJgByJH+B0d+NNDkD
	 pEZuPa9f6C7CVJt9Lyh0jsIeqfAwDHmFhMBfhD4CCSTuBLgAaOMO5QoYkRi2LfYEfVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
	b=F8o7aDLbN7MJEDU8EDZZ6Gk3hu33JGyHawZLWEd9tBVsLG8SAez++VeuJMQjkav+gZK7
	 GC76WmMW2fmpec23NJJdfRGWoMzHorMLPzf0tn1JLBz5iubHrF9MYnG4ks14sjIJ4jJ39
	 +1DFhoFQTUJIBh1tsyklfH5DcBBtKbB1mICVfA9HEl+GtLzQXBITYwPrltFmnIqSmrkZy
	 owVADTE1LdLw7LizjYlbNi4e//Qk8gmdAOSsye0he5q/FoQmbtpmcfeQmFM8FOOZZr2u7
	 uZjWPcNw0QVXLdnIsuEF8aBZAVSuW8WlRjyw4xI40O17nZb4DujWy9W0WUXJQ0eQfJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw8wsFcz;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F8606A32C
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 10:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392F8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw8wsFcz
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b335eeb340so23617227b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826570; x=1795431370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=pw8wsFczfKlQAIX/apwrgtn0Q/J3r0w/Qv4HZm97H1PM4TG0RrkgFYEwFqjIOwyUc1
         s8vECQT0nqyEvPAG/fLloqFez5FvX6bRxLmPADjmZp1sfi5gskvNolRzffPPQL1GpLA7
         bf8rdkLTPL7eptYWNw09JMIq3VsSefrGTIVPdM3naQfMUng/4SsFGvTRtkIO8hXCZ7xr
         tvlHwchyVujJ6qVzMGw/LL9h9WRo6+8o4V06q4CHqRJFSKYsbr0inno+Iil6qWwkNCzK
         ACBBy2MQPKpngSSrMotyOd5xNyoPXTZmclZIEVJrLMxFyb6JVuXJyPhwNEc1GSRXI4zE
         wH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826570; x=1795431370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=JA2bdBvBcLzKvdjMt8OvzlrkBQnOpBKs/gk3kd0LkGYtQt0IXVZ4qL8teyOzkP2nOG
         fOyT93Wbn/wHzZNtIzQnYJQBc26QiRFPHNd1pS9eVpdTy74JgqhBYuh4UJlYVi6kjc34
         KkbpWad1mk0+ZWjyF4WRpKd0rBQ9dOXyq1FRtbNk16BTqUmJvdr7/qudLunviQUsUbCr
         N/ZPwFfcS4Uw2UVHvrNIivoyuV2M6Ps1rH5tvCXgF1LshH0e5P+bT8fZaW+aA8UYcxdE
         YZ2pLyd4Eg0ajn7l4zdxP65+bCvxxTKJnVoVtD9z+txyCThOmX9jrzLTVGHBShWxy0ZP
         s0Ug==
X-Forwarded-Encrypted: i=1; AL+hErG9UUfUdD2oYYGBr0o1dVqwm/acsSgJau4+Oi6r0+iuLyexsRroOOkptuKp9dhhirOtD6C4STE3kyKAXQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+DckCQW+N6is16h7l/3f3/JvHICS5quedSthVX2gE38MhaviNs
	QULmPHqCbGTw8yhql+naoVUDCObzkjmmxs97XhvEOCzsjL9+BlKVgLnq
X-Gm-Gg: AZFdTZe2RMALm6yZXa15nPHBzvHNZe8HoyzY4IgAye47Xg4LpZXgb30+dh5NFY53oQ5
	6rBABJ8NuqAVwcPHLg+Jzq7XhepaueJFZO6E+u+N8obPDtM1pGHjcQayyH5JcJNAHig5CEsuY0W
	9jtKX7U8tE/9E+CRa3ujFuL/BYwuQPO+QSLguQUYXll67tm0JRw1WZBVm7p9cEjt0517G2d/3aT
	g9AKt4dRYsMKWnoWzLng1HFh1ORXMGRXZXqffrWSzv4R5XCbJ6JNoD/it0d/QnMxVXV3sUcrr/l
	tHRq6TDaPG6vmXJtAMluQooKHLJF6e/3CQAwl9kzOmNVlQ4Utf1eFSfImWgCzJWEVaZNbG8YLgh
	NHYFmgeyUO0Oi/4G+S8qbEZXcH7sp5XwOy2TuNMr0xMUupKo2ujtWBYKuGZEQWO03LgOmF+y/9Y
	Ln0YVOYBPIvraV9YdVMVOosp/hZb7e382dav0q5n3oW2ZAedQVyUA8iaOCZ3s69VSu942fn4XvN
	rZQHxGhcjA3KRZ0iLU8fM23/HUwnGs6ANfetFZW51Yub6+ZkXeg5wC/GKbu0C+AhiBYNIXSBFOw
	Cq1JYwexUp9Yi0YTJu4GCIwNXZWx0wI4is5EsMmQ7S4EY3Eptn0ejWm7z2woJndR6dp09cw+SYu
	BtRlbZrwp/JOzOWrvAZuGwZuAzYds05EG+ZSc
X-Received: by 2002:a05:690c:389:b0:8b3:2445:889b with SMTP id 00721157ae682-8b4aa2eb92bmr50305027b3.91.1794826570279;
        Mon, 16 Nov 2026 02:56:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:09 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Mon, 16 Nov 2026 07:55:43 -0300
Message-ID: <20261116105544.669029-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A733 USB 2.0 PHY uses the same configuration as the D1,
so add its compatible with the D1 fallback. The A733-specific
compatible lets the driver clear SIDDQ before releasing the PHY reset,
without changing the PHY configuration.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0

