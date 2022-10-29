Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A72574
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Oct 2022 15:23:48 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id fy4so19521742ejc.5
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Oct 2022 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LM0zNyCG6vu1EkX5rDqFjfE2Q0rAIzB1wYhK7YvnQns=;
        b=juD2ya3o94qMIsY8wraqg+F+Qd2G6JeimGfqSmHC2B1NwGQ0B3tn65TlxYbQAu8iOe
         sm/SU/BP21gVtp/zaXfagzyJPVRX2bJVtW1WPI9aF8/V+tS3+ErGABMslZgJUZle8Eru
         J4avK/5g/EmAlL93IR7KcbCgIzjKuC+RTTsJhKspyG4pXD2JUOsZsrP/pSo3PGGvmlpK
         L52/k8K6AUjBejickvlE5qICWZV4xDfvo+sftFbUSjW9XLL5vxzShdumRtJDwLDNCsjq
         sjvP1fyfEKmJtIjY82ShMZD29FGDnSpIvncz7K57KfHytH/AI56iP9jIpXkc9Gb3S8KL
         1g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM0zNyCG6vu1EkX5rDqFjfE2Q0rAIzB1wYhK7YvnQns=;
        b=0sP/Jx74PRlczStz4NYaBTog1rQb024aGqu6ZTYVL/6wsRaUH9t92TbhnE+JBWXpir
         fXqjiVhGs+6jPrh8ARshmGsFVop55ZbPA2L0q3Nt9wwDxKUV3mVNpiQTea0u3wWRTGfH
         zcn5xkUW2YlbxNrknOd2fyPAS6O8cMbIP99ss9421MTemG+7iS7cSJYSZFOodH7wtYyU
         5DIQMkyynLOFochSsPx4WfUNQHjMKuYupfUtlH5k118IKScxPk4kk250jli57eyiJnTA
         yuerMze4VsqyJQh1V1D1ys+ptymMv+jgdrVVd3bmq7AMJmU21agETrhBkndK0/N7AuV0
         tx3A==
X-Gm-Message-State: ACrzQf30GKZe9OMAlzvvWQOW704qb+FoSI7mH/lyO5dqkqhjLAN33WGc
	IwO8HOa66p0ZIA/CDjoVurU=
X-Google-Smtp-Source: AMsMyM7cufHmJnEOFkb7HDOqoa+AK1me5MwoKmn499nTc0wfkM2nSYIF9kssabeYNCPeuCtZPTe9Ww==
X-Received: by 2002:a17:907:97c3:b0:79b:3f8d:a354 with SMTP id js3-20020a17090797c300b0079b3f8da354mr4285123ejc.461.1667057026596;
        Sat, 29 Oct 2022 08:23:46 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id gg33-20020a17090689a100b0078b03d57fa7sm787034ejc.34.2022.10.29.08.23.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Oct 2022 08:23:46 -0700 (PDT)
To: wens@csie.org, samuel@sholland.org
Cc: mripard@kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [BISECTED] Allwinner A33 tablet does not fully power off
Message-ID: <9f8a0fc3-1d9a-b271-3c26-4f7373b8a3e9@gmail.com>
Date: Sat, 29 Oct 2022 18:23:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

After commit 843107498f91e57d1d4b22cd8787112726fdaeb4 (bus: sunxi-rsb: 
Implement suspend/resume/shutdown callbacks) Q8 A33 tablet I have here 
cannot be powered-on after power-off, it needs press-and-hold of the 
power button for 10 seconds (I guess some HW assisted power down 
happens) before it can be powered-on again.

The following patch makes it behave correctly:

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 60b082fe2ed0..30016d62044c 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -818,10 +818,7 @@ static int sunxi_rsb_remove(struct platform_device 
*pdev)

  static void sunxi_rsb_shutdown(struct platform_device *pdev)
  {
-       struct sunxi_rsb *rsb = platform_get_drvdata(pdev);
-
         pm_runtime_disable(&pdev->dev);
-       sunxi_rsb_hw_exit(rsb);
  }

  static const struct dev_pm_ops sunxi_rsb_dev_pm_ops = {


I guess the issue comes from the fact that by the time 'power off' 
command to the power management IC has to be send, the bus it lives on 
is already down, so the device is left in semi-powered down state. Ofc 
this is a wild guess, however, preventing the bus being turned off on 
shutdown fixes the issue.

Please LMK if the above is the correct approach so I will send a proper 
patch or something else shall be fixed.

Ivo
